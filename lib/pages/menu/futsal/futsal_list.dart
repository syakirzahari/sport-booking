import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FutsalPage extends StatefulWidget {
  const FutsalPage({Key? key}) : super(key: key);

  @override
  _FutsalPageState createState() => _FutsalPageState();
}

class _FutsalPageState extends State<FutsalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red[800], //change your color here
        ),
        title: Text(
          'Futsal',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}