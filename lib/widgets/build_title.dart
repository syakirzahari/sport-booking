import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/pages/menu/explore/explore.dart';

Positioned buildTitle(Size size) {
  return Positioned(
    bottom: 20.0,
    left: 20.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Sports Booking",
          style: GoogleFonts.poppins(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: size.height * 0.0075),
        Text(
          'Choose. Book. Enjoy.',
          style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
        ),
        SizedBox(height: size.height * 0.0075),
        ElevatedButton(
          child: const Text("Explore Now"),
          onPressed: () => Get.to(() => const ExplorePage()),
          style: ElevatedButton.styleFrom(
            primary: Colors.red[800],
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        )
      ],
    ),
  );
}
