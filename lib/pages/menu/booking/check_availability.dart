import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/api/api.dart';
import 'package:get/get.dart';
import 'package:sport_booking/models/slot.dart';
import 'package:sport_booking/pages/menu/booking/confirm_booking.dart';

class CheckAvailabilityPage extends StatefulWidget {
  const CheckAvailabilityPage({Key? key}) : super(key: key);

  @override
  State<CheckAvailabilityPage> createState() => _CheckAvailabilityPageState();
}

class _CheckAvailabilityPageState extends State<CheckAvailabilityPage> {
  ApiService apiService = ApiService();
  List<DataSlot> slot = [];
  bool _isNoOpponent = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final TextEditingController _controllerTeamName = TextEditingController();

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
                          child: Form(
                              key: globalFormKey,
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
                                              Text(
                                                "Place: " +
                                                    fa.venueSlot!.courtName
                                                        .toString(),
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.timer,
                                                    color: Colors.black,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                      "From: " +
                                                          fa.timeFrom
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.timer,
                                                    color: Colors.black,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                      "To: " +
                                                          fa.timeTo.toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.attach_money_outlined,
                                                    color: Colors.black,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                      "Deposit: RM " +
                                                          fa.depositRate
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15)),
                                                ],
                                              ),
                                            ])),
                                    Expanded(
                                        flex: 3,
                                        child: Chip(
                                            backgroundColor: Colors.red[800],
                                            label: Text(
                                                "RM " +
                                                    fa.rate.toString() +
                                                    ' / Slot',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 12))))
                                  ]),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: _controllerTeamName,
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000912),
                                      ),
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: ' Enter Team Name',
                                      hintStyle: TextStyle(
                                        color: Color(0xffA6B0BD),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                    ),
                                    validator: (usernameValue) {
                                      if (usernameValue!.isEmpty) {
                                        return 'Enter Team Name';
                                      }
                                      // username = usernameValue;
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  if (Get.arguments[1] == '1')
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: 24.0,
                                            width: 24.0,
                                            child: Theme(
                                              data: ThemeData(
                                                  unselectedWidgetColor:
                                                      Colors.black // Your color
                                                  ),
                                              child: Checkbox(
                                                activeColor: Colors.red,
                                                value: _isNoOpponent,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isNoOpponent = value!;
                                                    print(_isNoOpponent);
                                                  });
                                                },
                                              ),
                                            )),
                                        const SizedBox(width: 10.0),
                                        Text('I dont have any opponent',
                                            style: GoogleFonts.poppins(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 13,
                                              color: Colors.black,
                                            ))
                                      ],
                                    ), //
                                  const SizedBox(height: 10),

                                  SizedBox(
                                      width: double.infinity,
                                      child: TextButton(
                                          child: Text("Select".toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 14)),
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
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                      side: BorderSide(color: Colors.red)))),
                                          onPressed: () {
                                            // Get.to(() => const ConfirmBookingPage(),
                                            //     arguments: [
                                            //       fa.venueSlot!.courtName.toString(),
                                            //       fa.timeFrom.toString(),
                                            //       fa.timeTo.toString(),
                                            //       fa.rate.toString(),
                                            //       Get.arguments[1],
                                            //       Get.arguments[3],
                                            //     ]);
                                            if (validateAndSave()) {
                                              showModalBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return Wrap(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20),
                                                        child: Text(fa
                                                                .venueSlot!
                                                                .venue!
                                                                .name
                                                                .toString() +
                                                            ' - ' +
                                                            fa.venueSlot!
                                                                .courtName
                                                                .toString()),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      ListTile(
                                                        onTap: () {
                                                          Get.to(
                                                              () =>
                                                                  const ConfirmBookingPage(),
                                                              arguments: [
                                                                fa.venueSlot!
                                                                    .courtName
                                                                    .toString(),
                                                                fa.timeFrom
                                                                    .toString(),
                                                                fa.timeTo
                                                                    .toString(),
                                                                fa.depositRate
                                                                    .toString(),
                                                                fa.venueSlot!
                                                                    .sportId,
                                                                fa.venueSlot!
                                                                    .venue!.name
                                                                    .toString(),
                                                                fa.date,
                                                                fa.venueSlot!
                                                                    .id,
                                                                fa.venueSlot!
                                                                    .venue!.id,
                                                                1,
                                                                0,
                                                                fa.id
                                                                    .toString(),
                                                                _isNoOpponent,
                                                                _controllerTeamName
                                                                    .text
                                                              ]);
                                                        },
                                                        leading: const Icon(Icons
                                                            .attach_money_sharp),
                                                        title: Text(
                                                            'Pay Deposit: RM ' +
                                                                fa.depositRate
                                                                    .toString()),
                                                      ),
                                                      ListTile(
                                                        onTap: () {
                                                          Get.to(
                                                              () =>
                                                                  const ConfirmBookingPage(),
                                                              arguments: [
                                                                fa.venueSlot!
                                                                    .courtName
                                                                    .toString(),
                                                                fa.timeFrom
                                                                    .toString(),
                                                                fa.timeTo
                                                                    .toString(),
                                                                fa.rate
                                                                    .toString(),
                                                                fa.venueSlot!
                                                                    .sportId,
                                                                fa.venueSlot!
                                                                    .venue!.name
                                                                    .toString(),
                                                                fa.date,
                                                                fa.venueSlot!
                                                                    .id,
                                                                fa.venueSlot!
                                                                    .venue!.id,
                                                                0,
                                                                1,
                                                                fa.id
                                                                    .toString(),
                                                                _isNoOpponent,
                                                                _controllerTeamName
                                                                    .text
                                                              ]);
                                                        },
                                                        leading: const Icon(Icons
                                                            .attach_money_sharp),
                                                        title: Text('Pay : RM ' +
                                                            fa.rate.toString()),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          })),
                                ],
                              )))),
                );
              }),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
