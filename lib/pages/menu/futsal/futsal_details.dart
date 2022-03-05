import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/pages/menu/booking/booking.dart';

class FutsalDetails extends StatefulWidget {
  const FutsalDetails({Key? key}) : super(key: key);

  @override
  _FutsalDetailsState createState() => _FutsalDetailsState();
}

class _FutsalDetailsState extends State<FutsalDetails> {
  final String _bookmark = "Book Now";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = Get.size.height;

    var _directions = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding:
              EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
          child: Text(
            "Description :",
            style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 0.0, left: 20.0, right: 20.0, bottom: 0.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  Get.arguments[0].description.toString(),
                  style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.5), fontSize: 15),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Icon(Icons.phone),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      Get.arguments[0].telNo.toString(),
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.map_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      Get.arguments[0].state.toString(),
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 15),
                    ),
                  ],
                )
              ]),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            /// AppBar
            SliverPersistentHeader(
              delegate: MySliverAppBar(
                expandedHeight: _height - 20.0,
                img: Get.arguments[1],
                id: "dsads231",
                title: Get.arguments[0].name,
              ),
              pinned: true,
            ),

            SliverToBoxAdapter(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  const SizedBox(
                    height: 40.0,
                  ),

                  /// Description
                  _directions,

                  InkWell(
                    onTap: () => Get.to(() => const BookingPage(),
                        arguments: [Get.arguments[0].name, 'Futsal']),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 50.0, bottom: 30.0),
                      child: Container(
                        height: 52.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40.0))),
                        child: Center(
                          child: Text(
                            _bookmark,
                            style: const TextStyle(
                                fontFamily: "Sofia",
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30.0,
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  String img, id, title;

  MySliverAppBar(
      {required this.expandedHeight,
      required this.img,
      required this.id,
      required this.title});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      fit: StackFit.expand,
      children: [
        Container(
          height: 30.0,
          width: double.infinity,
          color: Colors.white,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            Get.arguments[0].name,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Sofia",
              fontWeight: FontWeight.w700,
              fontSize: (expandedHeight / 40) - (shrinkOffset / 40) + 18,
            ),
          ),
        ),
        Opacity(
          opacity: (1 - shrinkOffset / expandedHeight),
          child: Hero(
            tag: 'hero-tag-${id + title}',
            child: Material(
              color: Colors.transparent,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(img),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 620.0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.0, 1.0),
                      stops: [0.0, 1.0],
                      colors: <Color>[
                        Color(0x00FFFFFF),
                        Color(0xFFFFFFFF),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomLeft,
        //   child: Opacity(
        //     opacity: (1 - shrinkOffset / expandedHeight),
        //     child: Padding(
        //       padding: const EdgeInsets.only(
        //           top: 20.0, right: 20.0, left: 20.0, bottom: 40.0),
        //       child: Container(
        //         height: 120.0,
        //         width: double.infinity,
        //         decoration: BoxDecoration(
        //             borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        //             color: Colors.white.withOpacity(0.85)),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             Padding(
        //               padding: const EdgeInsets.only(top: 8.0),
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: <Widget>[
        //                   Padding(
        //                     padding:
        //                         const EdgeInsets.only(left: 15.0, right: 2.0),
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: <Widget>[
        //                         SizedBox(
        //                             width: 260.0,
        //                             child: Text(
        //                               title,
        //                               style: _txtStyleTitle.copyWith(
        //                                   fontSize: 27.0),
        //                               overflow: TextOverflow.clip,
        //                               maxLines: 2,
        //                               softWrap: true,
        //                             )),
        //                       ],
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding:
        //                         const EdgeInsets.only(left: 15.0, right: 0.0),
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: <Widget>[
        //                         Column(
        //                           mainAxisAlignment: MainAxisAlignment.start,
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: <Widget>[
        //                             Padding(
        //                               padding: const EdgeInsets.only(top: 10.0),
        //                               child: Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.start,
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                 children: const <Widget>[
        //                                   Text(
        //                                     "Football Pitch",
        //                                     style: TextStyle(
        //                                         color: Colors.black26,
        //                                         fontSize: 15.5,
        //                                         fontFamily: "Sofia",
        //                                         fontWeight: FontWeight.w400),
        //                                     maxLines: 3,
        //                                     overflow: TextOverflow.ellipsis,
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                         const Padding(
        //                           padding:
        //                               EdgeInsets.only(left: 15.0, right: 25.0),
        //                           child: SizedBox(
        //                             width: 100.0,
        //                             child: Center(
        //                                 child: TextButton(
        //                               onPressed: null,
        //                               child: Text(
        //                                 'Open Map',
        //                                 style: TextStyle(
        //                                     fontSize: 17.0,
        //                                     color: Colors.redAccent,
        //                                     fontWeight: FontWeight.w600,
        //                                     fontFamily: "Sofia"),
        //                                 overflow: TextOverflow.clip,
        //                               ),
        //                             )),
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40.0),
                            ),
                            color: Colors.white70,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                    ))),
            const SizedBox(
              width: 36.0,
            )
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
