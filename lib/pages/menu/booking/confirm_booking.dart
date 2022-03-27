import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmBookingPage extends StatefulWidget {
  const ConfirmBookingPage({Key? key}) : super(key: key);

  @override
  State<ConfirmBookingPage> createState() => _ConfirmBookingPageState();
}

class _ConfirmBookingPageState extends State<ConfirmBookingPage> {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Confirm Booking',
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.red[900],
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              height: 150,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                color: Colors.red[900],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: 50,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                height: 500,
                padding: const EdgeInsets.all(20),
                width: Get.size.width - 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5),
                    ]),
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Venue:',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      Text(Get.arguments[5] ?? '',
                          style: GoogleFonts.poppins(
                              fontSize: 17, color: Colors.grey[600])),
                      const SizedBox(height: 10),
                      Text('Sport Category:',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      if (Get.arguments[4] == 1)
                        Text('Football',
                            style: GoogleFonts.poppins(
                                fontSize: 17, color: Colors.grey[600])),
                      if (Get.arguments[4] == 2)
                        Text('Futsal',
                            style: GoogleFonts.poppins(
                                fontSize: 17, color: Colors.grey[600])),
                      if (Get.arguments[4] == 3)
                        Text('Badminton',
                            style: GoogleFonts.poppins(
                                fontSize: 17, color: Colors.grey[600])),
                      const SizedBox(height: 10),
                      Text('Slot Venue:',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      Text(Get.arguments[0],
                          style: GoogleFonts.poppins(
                              fontSize: 17, color: Colors.grey[600])),
                      const SizedBox(height: 10),
                      Text('Date:',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      Text(Get.arguments[6],
                          style: GoogleFonts.poppins(
                              fontSize: 17, color: Colors.grey[600])),
                      const SizedBox(height: 10),
                      Text('From:',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      Text(Get.arguments[1],
                          style: GoogleFonts.poppins(
                              fontSize: 17, color: Colors.grey[600])),
                      const SizedBox(height: 10),
                      Text('To:',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      Text(Get.arguments[2],
                          style: GoogleFonts.poppins(
                              fontSize: 17, color: Colors.grey[600])),
                      const SizedBox(height: 20),
                      Text(
                          '1. Please make sure you arrives at the venue at least 10 minutes before game starts',
                          style: GoogleFonts.poppins(
                              fontStyle: FontStyle.italic,
                              fontSize: 10,
                              color: Colors.black)),
                      Text(
                          '2. No refund will be provided after booking is confirmed',
                          style: GoogleFonts.poppins(
                              fontStyle: FontStyle.italic,
                              fontSize: 10,
                              color: Colors.black)),
                    ],
                  ),
                ))),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.red[900]),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Total: RM " + Get.arguments[3],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        child: Text("Pay Now".toUpperCase(),
                            style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(10)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Colors.black)))),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
          )
          // Trick to add the submit button
          // Bottom buttons
        ],
      ),
    );
  }
}
