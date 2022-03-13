import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/pages/menu/booking/check_availability.dart';

class InstantBookingPage extends StatefulWidget {
  const InstantBookingPage({Key? key}) : super(key: key);

  @override
  State<InstantBookingPage> createState() => _InstantBookingPageState();
}

class _InstantBookingPageState extends State<InstantBookingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  ApiService apiService = ApiService();
  List? sportList, venueList = [];
  String? sportType, venueType;
  String? _setTime, _setDate, venueName;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat("yyyy-MM-dd").format(selectedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    apiService.getSportType().then((value) {
      setState(() {
        sportList = value;
      });
    });

    ApiService.getListVenues().then((value) {
      setState(() {
        venueList = value;
      });
    });
  }

  @override
  void dispose() {
    // DO STUFF
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/landing.png"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: const EdgeInsets.only(top: 50, left: 20),
                color: const Color.fromARGB(255, 148, 31, 31).withOpacity(0.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                          text: "Check ",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              letterSpacing: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: 'Availability',
                              style: GoogleFonts.poppins(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: 180,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: 380,
              padding: const EdgeInsets.all(20),
              width: Get.size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _dropdownSport(),
                      const SizedBox(height: 20),
                      _dropdownVenue(),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          //  margin: EdgeInsets.only(top: 30),
                          width: double.infinity,
                          height: 70.0,
                          alignment: Alignment.center,
                          //  decoration: BoxDecoration(color: Colors.grey[200]),
                          child: TextFormField(
                            // textAlign: TextAlign.left,
                            onSaved: (String? val) {
                              _setTime = val;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Select Date';
                              }
                              return null;
                            },
                            enabled: false,
                            keyboardType: TextInputType.text,
                            controller: _dateController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(13.0),
                              hintText: "Select Date",

                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)),
                              // labelText: 'Time',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.red[900],
                            child: MaterialButton(
                              minWidth: Get.size.width,
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              onPressed: () async {
                                if (validateAndSave()) {
                                  print('sport: ' + sportType.toString());
                                  print('venue: ' + venueType.toString());
                                  print('date: ' + _dateController.text);
                                  Get.to(() => const CheckAvailabilityPage(),
                                      arguments: [
                                        venueType.toString(),
                                        sportType.toString(),
                                        _dateController.text,
                                        venueName
                                      ]);
                                }
                              },
                              child: Text(
                                'Check Availability ',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ),
          // Trick to add the submit button
          // Bottom buttons
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget _dropdownSport() {
    return Container(
        alignment: Alignment.centerLeft,
        // decoration: BoxDecoration(
        //   color: Colors.grey[100],
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        height: 60.0,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Expanded(
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    // enabledBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    // focusedBorder: InputBorder.none
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.2, color: Colors.black12)),
                  ),
                  isExpanded: true,
                  value: sportType,
                  hint: const Text(
                    'Select Sport',
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      sportType = newValue;
                      print('Code ID:' + sportType!);
                    });
                  },
                  validator: (value) => value == null ? "Select Sport" : null,
                  items: sportList?.map((item) {
                        return DropdownMenuItem(
                          child: Text(item.name),
                          value: item.id.toString(),
                        );
                      }).toList() ??
                      [],
                ),
              ),
            ),
          ),
        ]));
  }

  Widget _dropdownVenue() {
    return Container(
        alignment: Alignment.centerLeft,
        height: 60.0,
        // decoration: BoxDecoration(
        //   color: Colors.grey[100],
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Expanded(
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    // enabledBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    // focusedBorder: InputBorder.none
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.2, color: Colors.black12)),
                  ),
                  isExpanded: true,
                  value: venueType,
                  hint: const Text(
                    'Select Venue',
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      venueType = newValue;
                      print('Code ID:' + venueType!);
                    });
                  },
                  validator: (value) => value == null ? "Select Venue" : null,
                  items: venueList?.map((item) {
                        return DropdownMenuItem(
                          child: Text(item.name),
                          value: item.id.toString(),
                        );
                      }).toList() ??
                      [],
                ),
              ),
            ),
          ),
        ]));
  }
}
