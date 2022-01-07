import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/controllers/badmintonController.dart';

class BadmintonPage extends StatefulWidget {
  const BadmintonPage({Key? key}) : super(key: key);

  @override
  _BadmintonPageState createState() => _BadmintonPageState();
}

class _BadmintonPageState extends State<BadmintonPage> {
  @override
  Widget build(BuildContext context) {
    final bController = Get.put(BadmintonController());

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red[800], //change your color here
        ),
        title: Text(
          'Badminton',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
