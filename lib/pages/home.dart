import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_booking/widgets/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
    Size size = Get.size;
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Home',
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text(
            'Hi, ' + name.toString() + '!',
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
          ),
        ]),
        // centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Body(
        size: size,
      ),
    );
  }
}
