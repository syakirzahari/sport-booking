import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerOpponentTeamName =
      TextEditingController();
  bool _isLoading = false;

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

                  // return Padding(
                  //     padding: const EdgeInsets.only(top: 10.0),
                  //     child: Card(
                  //       elevation: 0,
                  //       child: ExpansionTile(
                  //         title: Text(fa.venue!.name.toString(),
                  //             overflow: TextOverflow.ellipsis,
                  //             style: GoogleFonts.poppins(
                  //                 textStyle: const TextStyle(
                  //               fontSize: 17,
                  //               fontWeight: FontWeight.w500,
                  //               color: Color(0xff000912),
                  //             ))),
                  //         subtitle: Text(
                  //           fa.slotAvailability!.date.toString(),
                  //           style: TextStyle(color: Colors.red[800]),
                  //         ),
                  //         children: <Widget>[
                  //           Padding(
                  //               padding:
                  //                   const EdgeInsets.only(left: 15, bottom: 10),
                  //               child: Row(
                  //                 children: [
                  //                   Text('Time From: ',
                  //                       style: GoogleFonts.poppins(
                  //                           textStyle: const TextStyle(
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Color(0xff000912),
                  //                       ))),
                  //                   Text(fa.slotAvailability!.timeFrom
                  //                       .toString())
                  //                 ],
                  //               )),
                  //           Padding(
                  //               padding:
                  //                   const EdgeInsets.only(left: 15, bottom: 10),
                  //               child: Row(
                  //                 children: [
                  //                   Text(
                  //                     'Time To: ',
                  //                     style: GoogleFonts.poppins(
                  //                       textStyle: const TextStyle(
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Color(0xff000912),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Text(fa.slotAvailability!.timeTo.toString())
                  //                 ],
                  //               )),
                  //           Padding(
                  //               padding:
                  //                   const EdgeInsets.only(left: 15, bottom: 10),
                  //               child: Row(
                  //                 children: [
                  //                   Text('Place: ',
                  //                       style: GoogleFonts.poppins(
                  //                           textStyle: const TextStyle(
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Color(0xff000912),
                  //                       ))),
                  //                   Text(fa.slot!.courtName.toString())
                  //                 ],
                  //               )),
                  //           Padding(
                  //               padding:
                  //                   const EdgeInsets.only(left: 15, bottom: 10),
                  //               child: Row(
                  //                 children: [
                  //                   Text('Team Name: ',
                  //                       style: GoogleFonts.poppins(
                  //                           textStyle: const TextStyle(
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Color(0xff000912),
                  //                       ))),
                  //                   Text(fa.teamName.toString())
                  //                 ],
                  //               )),
                  //           Padding(
                  //               padding:
                  //                   const EdgeInsets.only(left: 15, bottom: 10),
                  //               child: Row(
                  //                 children: [
                  //                   Text('Contact No: ',
                  //                       style: GoogleFonts.poppins(
                  //                           textStyle: const TextStyle(
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Color(0xff000912),
                  //                       ))),
                  //                   Text(
                  //                       fa.bookedBy!.telephoneNumber.toString())
                  //                 ],
                  //               ))
                  //         ],
                  //       ),
                  //     ));

                  return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(fa.venue!.name.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff000912),
                                    ))),
                                Text(
                                  fa.slotAvailability!.date.toString(),
                                  style: TextStyle(color: Colors.red[800]),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, bottom: 10),
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
                                    padding: const EdgeInsets.only(
                                        left: 15, bottom: 10),
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
                                        Text(fa.slotAvailability!.timeTo
                                            .toString())
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, bottom: 10),
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
                                    padding: const EdgeInsets.only(
                                        left: 15, bottom: 10),
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
                                    padding: const EdgeInsets.only(
                                        left: 15, bottom: 10),
                                    child: Row(
                                      children: [
                                        Text('Contact No: ',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff000912),
                                            ))),
                                        Text(fa.bookedBy!.telephoneNumber
                                            .toString())
                                      ],
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    child: TextButton(
                                        child: Text("Approach!".toUpperCase(),
                                            style:
                                                const TextStyle(fontSize: 14)),
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
                                        onPressed: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child: Form(
                                                        child: Form(
                                                            key: _formKey,
                                                            child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(20),
                                                                child: ListView(
                                                                  children: [
                                                                    const SizedBox(
                                                                        height:
                                                                            10),
                                                                    Text(
                                                                      fa.teamName
                                                                              .toString() +
                                                                          ' vs ',
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            20),
                                                                    _buildTextWeight(),
                                                                    const SizedBox(
                                                                        height:
                                                                            10),
                                                                    SizedBox(
                                                                      width: Get
                                                                          .size
                                                                          .width,
                                                                      child: ElevatedButton(
                                                                          style: ElevatedButton.styleFrom(
                                                                            elevation:
                                                                                0.0,
                                                                            padding:
                                                                                const EdgeInsets.all(0.0),
                                                                          ),
                                                                          onPressed: () async {
                                                                            setState(() {
                                                                              _isLoading = true;
                                                                            });
                                                                            final String
                                                                                opponent =
                                                                                _controllerOpponentTeamName.text;

                                                                            final String
                                                                                id =
                                                                                fa.id.toString();

                                                                            await apiService.postOpponent(id, opponent).then((isSuccess) {
                                                                              setState(() => _isLoading = false);
                                                                              Get.back();
                                                                              Flushbar(
                                                                                title: 'Hooray!',
                                                                                message: "You secured an opponent!",
                                                                                duration: const Duration(seconds: 4),
                                                                              ).show(context);

                                                                              setState(() {});
                                                                            });
                                                                          },
                                                                          child: Ink(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient: LinearGradient(begin: Alignment.centerRight, end: Alignment.centerLeft, colors: [
                                                                                Colors.red[900]!,
                                                                                Colors.red[500]!,
                                                                              ]),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              constraints: const BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
                                                                              alignment: Alignment.center,
                                                                              child: _isLoading == true
                                                                                  ? const CircularProgressIndicator(color: Colors.white)
                                                                                  : Text(
                                                                                      'OK',
                                                                                      style: GoogleFonts.poppins(
                                                                                          // fontStyle: FontStyle.italic,
                                                                                          fontSize: 15,
                                                                                          color: Colors.white,
                                                                                          fontWeight: FontWeight.bold),
                                                                                    ),
                                                                            ),
                                                                          )),
                                                                    ),
                                                                  ],
                                                                )))));
                                              });
                                        })),
                              ],
                            ),
                          )));
                }));
  }

  Widget _buildTextWeight() {
    return TextFormField(
      controller: _controllerOpponentTeamName,
      keyboardType: TextInputType.number,
      maxLines: 1,
      decoration: InputDecoration(
        filled: true,
        focusColor: Colors.white,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        labelText: "Your Team Name",
      ),
      onChanged: (value) {},
    );
  }
}
