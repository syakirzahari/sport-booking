import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_booking/pages/login.dart';
import 'package:sport_booking/pages/settings/about.dart';
import 'package:sport_booking/pages/settings/account.dart';
import 'package:sport_booking/pages/settings/change_password.dart';
import 'package:sport_booking/pages/settings/policy.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_booking/widgets/profile_menu.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key? key}) : super(key: key);
  @override
  BodyProfileState createState() => BodyProfileState();
}

class BodyProfileState extends State<BodyProfile> {
  String? id, name;

  @override
  void initState() {
    super.initState();
    _userDetails();
  }

  void _userDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString('id'));
      name = (prefs.getString('name'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/default.png"),
                ),
                Text(
                  name.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: Icons.supervised_user_circle_outlined,
            press: () => Get.to(() => const AccountPage()),
          ),
          ProfileMenu(
            text: "Change Password",
            icon: Icons.password_outlined,
            press: () => Get.to(() => const ChangePasswordPage()),
          ),
          ProfileMenu(
            text: "About Us",
            icon: Icons.info_outline,
            press: () => Get.to(() => const AboutPage()),
          ),
          ProfileMenu(
            text: "Privacy & Policy",
            icon: Icons.privacy_tip_outlined,
            press: () => Get.to(() => const PolicyPage()),
          ),
          ProfileMenu(
            text: "Contact Us",
            icon: Icons.textsms_outlined,
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: Icons.logout_outlined,
            press: () {
              displayDeleteDialog();
            },
          ),
          const SizedBox(height: 10),
          Text(
            'All Right Reserved © 2022',
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
          )
        ],
      ),
    );
  }
}

displayDeleteDialog() {
  Get.defaultDialog(
    title: "Log Out",
    titleStyle: const TextStyle(fontSize: 20),
    buttonColor: Colors.red[800],
    cancelTextColor: Colors.black,
    middleText: 'Are you sure?',
    textCancel: "No",
    textConfirm: "Yes",
    confirmTextColor: Colors.white,
    onCancel: () {},
    onConfirm: () {
      _deleteToken();
      Get.offAll(() => const LoginPage());
    },
  );
}

void _deleteToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.remove("token");
}
