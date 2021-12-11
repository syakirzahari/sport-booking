import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/widgets/body_profile.dart';

class ProfilePage extends StatelessWidget {
  static String routeName = "/profile";

  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const BodyProfile(),
    );
  }
}
