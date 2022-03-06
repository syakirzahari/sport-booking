import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/api/api.dart';
import 'package:get/get.dart';
import 'package:sport_booking/models/slot.dart';

class CheckAvailabilityPage extends StatefulWidget {
  const CheckAvailabilityPage({Key? key}) : super(key: key);

  @override
  State<CheckAvailabilityPage> createState() => _CheckAvailabilityPageState();
}

class _CheckAvailabilityPageState extends State<CheckAvailabilityPage> {
  ApiService apiService = ApiService();
  List<DataSlot> slot = [];

  @override
  void initState() {
    apiService
        .checkAvailability(Get.arguments[0], Get.arguments[1], Get.arguments[2])
        .then((value) {
      setState(() {
        slot = value;
      });
    });
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
        iconTheme: IconThemeData(
          color: Colors.red[800], //change your color here
        ),
        title: Text(
          'Select Slot',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        elevation: 1,
        // centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: buildListView(context, slot)),
      ),
    );
  }
}

Widget buildListView(context, List<DataSlot>? sl) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: sl!.isEmpty
        ? const Center(
            child: Text(
            'No slot on this date',
            style: TextStyle(color: Colors.black),
          ))
        : ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: sl.length,
            itemBuilder: (context, index) {
              DataSlot fa = sl[index];

              // print('count: ' + da.length.toString());
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Place: " +
                                            fa.venueSlot!.courtName.toString()),
                                        const SizedBox(height: 10),
                                        Text("Time From: " +
                                            fa.timeFrom.toString()),
                                        Text("Time To: " + fa.timeTo.toString())
                                      ])),
                              Expanded(
                                  flex: 1,
                                  child: Text("RM " + fa.rate.toString()))
                            ]),
                            const SizedBox(height: 10),
                            SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                    child: Text("Select".toUpperCase(),
                                        style: const TextStyle(fontSize: 14)),
                                    style: ButtonStyle(
                                        padding:
                                            MaterialStateProperty.all<EdgeInsets>(
                                                const EdgeInsets.all(15)),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.red),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                                side: BorderSide(color: Colors.red)))),
                                    onPressed: () {})),
                          ],
                        ))),
              );
            }),
  );
}
