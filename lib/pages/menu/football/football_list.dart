import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FootballPage extends StatefulWidget {
  const FootballPage({Key? key}) : super(key: key);

  @override
  _FootballPageState createState() => _FootballPageState();
}

class _FootballPageState extends State<FootballPage> {
  @override
  Widget build(BuildContext context) {
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
