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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                      child: Form(
                          key: _formKey,
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
                              // Text(
                              //   'Date:',
                              //   style: GoogleFonts.poppins(
                              //       fontSize: 14,
                              //       color: Colors.red[800],
                              //       fontWeight: FontWeight.w700),
                              // ),
                              DateTimePicker(
                                decoration: InputDecoration(
                                  filled: true,
                                  focusColor: Colors.white,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  labelText: "Select Date",
                                  labelStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.red[800],
                                      fontWeight: FontWeight.w700),
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
                              const SizedBox(height: 30.0),
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
                                        // final String nama = _controllerName.text;
                                      },
                                      child: Text(
                                        'Check Availability ',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 50,
                                child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.greenAccent,
                                    color: Colors.black,
                                    child: MaterialButton(
                                      minWidth: Get.size.width,
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      onPressed: () async {
                                        Get.back();
                                      },
                                      child: Text(
                                        'Back',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              )
                            ],
                          ))),
                )),
          ],
        ),
      ),
    );
  }

  Widget _dropdownSport() {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 60.0,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Expanded(
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none
                      // border: OutlineInputBorder(),
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
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Expanded(
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
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
