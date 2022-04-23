import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/find_opponent.dart';

class LookingOpponentPage extends StatefulWidget {
  const LookingOpponentPage({Key? key}) : super(key: key);

  @override
  State<LookingOpponentPage> createState() => _LookingOpponentPageState();
}

class _LookingOpponentPageState extends State<LookingOpponentPage> {
  ApiService apiService = ApiService();
  List<DataOpponent>? op = [];

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Opponent',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: apiService.getOpponentList(),
            builder: (BuildContext context,
                AsyncSnapshot<List<DataOpponent>> snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                op = snapshot.data;
                if (op == null) {
                  return const Center(
                    child: Text("No Opponent Found"),
                  );
                } else {
                  return _listBuildView(op);
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.red[800],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _listBuildView(op) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: op.isEmpty
            ? Center(
                child: Text(
                'No Booking Found',
                style: context.theme.textTheme.bodyText1,
              ))
            : ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: op.length,
                itemBuilder: (context, index) {
                  DataOpponent fa = op[index];

                  return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Card(
                        elevation: 1,
                        child: ExpansionTile(
                          title: Text(fa.venue!.name.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000912),
                              ))),
                          subtitle: Text(
                            fa.slotAvailability!.date.toString(),
                            style: TextStyle(color: Colors.red[800]),
                          ),
                          children: <Widget>[
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 10),
                                child: Row(
                                  children: [
                                    Text('Time From: ',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff000912),
                                        ))),
                                    Text(fa.slotAvailability!.timeFrom
                                        .toString())
                                  ],
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Time To: ',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff000912),
                                        ),
                                      ),
                                    ),
                                    Text(fa.slotAvailability!.timeTo.toString())
                                  ],
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 10),
                                child: Row(
                                  children: [
                                    Text('Place: ',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff000912),
                                        ))),
                                    Text(fa.slot!.courtName.toString())
                                  ],
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 10),
                                child: Row(
                                  children: [
                                    Text('Team Name: ',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff000912),
                                        ))),
                                    Text(fa.teamName.toString())
                                  ],
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 10),
                                child: Row(
                                  children: [
                                    Text('Contact No: ',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff000912),
                                        ))),
                                    Text(
                                        fa.bookedBy!.telephoneNumber.toString())
                                  ],
                                ))
                          ],
                        ),
                      ));
                }));
  }
}
