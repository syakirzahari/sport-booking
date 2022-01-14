import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/widgets/build_title.dart';
import 'package:sport_booking/widgets/sport_menu.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                width: double.infinity,
                height: size.height * 0.55,
                fit: BoxFit.fill,
                image: const AssetImage("assets/images/landing.JPG"),
              ),
              buildTitle(size),
            ],
          ),
          SizedBox(height: size.height * 0.012),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.06),
            child: Text(
              "Our Services",
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: size.height * 0.0075),
          PlacesStaggeredView(size: size, games: game)
        ],
      ),
    );
  }
}
