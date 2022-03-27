import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:sport_booking/pages/menu/booking/booking.dart';

class ExploreDetails extends StatefulWidget {
  const ExploreDetails({Key? key}) : super(key: key);

  @override
  State<ExploreDetails> createState() => _ExploreDetailsState();
}

class _ExploreDetailsState extends State<ExploreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[20],
      body: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.blue,
            child: Image.network(
              Get.arguments[1],
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 50,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => Get.back(),
                      child: CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.4),
                        radius: 20,
                        child: const Icon(Icons.chevron_left_outlined,
                            color: Colors.white),
                      )),
                  InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.4),
                        radius: 20,
                        child: const Icon(Icons.share, color: Colors.white),
                      )),
                ],
              )),
          Container(
            margin: const EdgeInsets.only(top: 200, left: 15, right: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
            ),
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      Get.arguments[0].name,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Get.arguments[0].description.toString(),
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    const SizedBox(height: 20),
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
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const BookingPage(),
                          arguments: [Get.arguments[0], 3]),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 50.0, bottom: 30.0),
                        child: Container(
                          height: 52.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.red[800],
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(40.0))),
                          child: const Center(
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                  fontFamily: "Sofia",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      )),
    );
  }
}
