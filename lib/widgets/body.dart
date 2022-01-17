import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/widgets/build_title.dart';
import 'package:sport_booking/widgets/sport_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ApiService apiService = ApiService();
  List med = [];

  @override
  void initState() {
    super.initState();
    // getListSlider();
    apiService.getListSlider().then((value) {
      setState(() {
        value.map((e) => med.add(e.media![0].path)).toList();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1.0,
                  height: widget.size.height * 0.45,
                ),
                items: med
                    .map((e) => SizedBox(child: Image.network(e.toString())))
                    .toList(),
              ),
              buildTitle(widget.size),
            ],
          ),
          SizedBox(height: widget.size.height * 0.012),
          Padding(
            padding: EdgeInsets.only(left: widget.size.width * 0.06),
            child: Text(
              "Our Services",
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: widget.size.height * 0.0075),
          PlacesStaggeredView(size: widget.size, games: game)
        ],
      ),
    );
  }
}
