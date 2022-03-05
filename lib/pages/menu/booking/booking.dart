import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:sport_booking/api/api.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final TextEditingController _controllerDate = TextEditingController();
  final bool _isLoading = false;
  final format = DateFormat("yyyy-MM-dd");
  ApiService apiService = ApiService();
  List? sportList, venueList = [];
  String? _selectedDate, sportType, venueType;

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

    if (Get.arguments != null) {
      sportType = Get.arguments[1].toString();
      venueType = Get.arguments[0].toString();
    }
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
          'Booking Form',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        elevation: 1,
        // centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                // height: double.infinity,
                child: Card(
                  elevation: 0,
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sport Type:',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.red[800],
                                fontWeight: FontWeight.w700),
                          ),
                          _dropdownSport(),
                          const SizedBox(height: 10),
                          Text(
                            'Venue:',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.red[800],
                                fontWeight: FontWeight.w700),
                          ),
                          _dropdownVenue(),
                          const SizedBox(height: 10),
                          Text(
                            'Date:',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.red[800],
                                fontWeight: FontWeight.w700),
                          ),
                          DateTimePicker(
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.7, color: Colors.black54),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.7, color: Colors.black54),
                              ),
                            ),
                            controller: _controllerDate,
                            type: DateTimePickerType.date,
                            dateLabelText: 'Tarikh Pendaftaran',
                            firstDate: DateTime(1995),
                            lastDate: DateTime.now().add(const Duration(
                                days:
                                    365)), // This will add one year from current date
                            validator: (value) {
                              return null;
                            },
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  _selectedDate = value;
                                  print(_selectedDate);
                                });
                              }
                            },
                            // We can also use onSaved
                            onSaved: (value) {
                              if (value!.isNotEmpty) {
                                _selectedDate = value;
                              }
                            },
                          ),
                        ],
                      )),
                )),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 50.0, bottom: 10.0),
                child: Container(
                  height: 52.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.red[800],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(40.0))),
                  child: const Center(
                    child: Text(
                      'Next',
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
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 30.0),
                child: Container(
                  height: 52.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(40.0))),
                  child: const Center(
                    child: Text(
                      'Back',
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
        ),
      ),
    );
  }

  Widget _dropdownSport() {
    return Container(
        alignment: Alignment.centerLeft,
        height: 80.0,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Expanded(
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
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
        height: 80.0,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Expanded(
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
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
