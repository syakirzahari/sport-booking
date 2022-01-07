import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/controllers/footballController.dart';

class FootballPage extends StatefulWidget {
  const FootballPage({
    Key? key,
  }) : super(key: key);

  @override
  _FootballPageState createState() => _FootballPageState();
}

class _FootballPageState extends State<FootballPage> {
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // DO STUFF
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fController = Get.put(FootballController());

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red[800], //change your color here
        ),
        title: Text(
          'Football',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
