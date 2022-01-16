import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/pages/menu/badminton/badminton_list.dart';
import 'package:sport_booking/pages/menu/football/football_list.dart';
import 'package:sport_booking/pages/menu/futsal/futsal_list.dart';

List game = [
  {
    "image": "assets/images/football.jpg",
    "name": "Football",
  },
  {
    "image": "assets/images/futsal.jpg",
    "name": "Futsal",
  },
  {
    "image": "assets/images/badminton.jpg",
    "name": "Badminton",
  },
];

final _pageOptions = [
  const FootballPage(),
  const FutsalPage(),
  const BadmintonPage(),
];

class PlacesStaggeredView extends StatelessWidget {
  const PlacesStaggeredView({
    Key? key,
    required this.size,
    required this.games,
  }) : super(key: key);
  final Size size;
  final List games;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      child: SizedBox(
        height: Get.size.height * 0.5,
        width: double.infinity,
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: game.length,
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Get.to(() => _pageOptions[index], arguments: 1),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      game[index]["image"],
                    ),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    game[index]["name"],
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(1, index == 0 ? 1.5 : 0.75),
        ),
      ),
    );
  }
}
