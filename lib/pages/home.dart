import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/widgets/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            'Hi, Syakir!',
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
