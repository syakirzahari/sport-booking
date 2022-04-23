import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LookingOpponentPage extends StatefulWidget {
  const LookingOpponentPage({Key? key}) : super(key: key);

  @override
  State<LookingOpponentPage> createState() => _LookingOpponentPageState();
}

class _LookingOpponentPageState extends State<LookingOpponentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Opponent',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
