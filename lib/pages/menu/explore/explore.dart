import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/controllers/venue_controller.dart';
import 'package:sport_booking/models/sport_venue.dart';
import 'package:sport_booking/pages/menu/explore/explore_details.dart';
// import 'package:sport_booking/pages/menu/football/football_details.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final veController = Get.put(VenueController());

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.red[800], //change your color here
          ),
          title: Text(
            'Explore Now',
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Obx(() {
                    if (veController.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.red[800],
                        ),
                      );
                    }
                    return _buildListView(veController.ven);
                  }),
                ],
              )),
        ));
  }

  Widget _buildListView(da) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: da!.isEmpty
          ? const Center(
              child: Text(
              'No Data',
              style: TextStyle(color: Colors.white),
            ))
          : ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: da.length ?? 0,
              itemBuilder: (context, index) {
                DataSport bt = da[index];
                List<Media> med = List<Media>.from(bt.media!);
                return GestureDetector(
                    onTap: () {
                      Get.to(() => const ExploreDetails(),
                          arguments: [bt, med[0].path.toString()]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12.0, top: 15.0),
                      child: Container(
                        height: 250.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12.withOpacity(0.1),
                                  blurRadius: 3.0,
                                  spreadRadius: 1.0)
                            ]),
                        child: Column(children: [
                          Container(
                            height: 165.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0)),
                              image: DecorationImage(
                                  image: NetworkImage(med[0].path.toString()),
                                  fit: BoxFit.cover),
                            ),
                            // child: const Padding(
                            //   padding: EdgeInsets.only(top: 10.0, right: 10.0),
                            //   child: CircleAvatar(
                            //       radius: 20.0,
                            //       backgroundColor: Colors.black12,
                            //       child: Icon(
                            //         Icons.favorite_border,
                            //         color: Colors.white,
                            //       )),
                            // ),
                            alignment: Alignment.topRight,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                          width: 220.0,
                                          child: Text(
                                            bt.name.toString(),
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      Text(
                                        'Futsal Court',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black, fontSize: 12),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 5.0)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.9),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            const Icon(
                                              Icons.location_on,
                                              size: 16.0,
                                              color: Colors.black26,
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 3.0)),
                                            Text(bt.district.toString())
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 13.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "RM 20",
                                        style: GoogleFonts.poppins(
                                            color: Colors.red[800],
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text("per hour",
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey[500],
                                              fontSize: 12))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ));
              }),
    );
  }
}
