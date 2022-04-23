import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/profile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  ApiService apiService = ApiService();
  DataProfile? pro;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff6f7f9),
        appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text("My Account",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            // hides default back button
            // actions: [
            //   PopupMenuButton<String>(
            //     onSelected: handleClick,
            //     itemBuilder: (BuildContext context) {
            //       return {'Kemaskini Kata Laluan', 'Tentang Kami'}
            //           .map((String choice) {
            //         return PopupMenuItem<String>(
            //           value: choice,
            //           child: Text(choice),
            //         );
            //       }).toList();
            //     },
            //   ),
            // ],
            flexibleSpace: Container(
                decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.red[800]!,
                    Colors.red[800]!,
                  ]),
            ))),
        body: SingleChildScrollView(
            child: Column(children: [
          FutureBuilder(
            future: apiService.getUserProfile(),
            builder:
                (BuildContext context, AsyncSnapshot<DataProfile?> snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                // Get.offAll(() => LoginPage());
                return const Text('Getting data...'); // return empty widget

              } else if (snapshot.connectionState == ConnectionState.done) {
                pro = snapshot.data;
                if (pro == null) {
                  return const Center(
                    child: Text("No Data"),
                  );
                } else {
                  // return Container();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipPath(
                            clipper: CustomShapeClipper(),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 30.0, right: 10.0, left: 25.0),
                              height: 200.0,
                              decoration: BoxDecoration(
                                  // color: Color.fromRGBO(244, 244, 244, 1)
                                  color: Colors.red[800]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, right: 20.0, left: 20.0),
                            child: Container(
                                width: double.infinity,
                                height: Get.size.height / 10,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          offset: const Offset(0.0, 3.0),
                                          blurRadius: 15.0)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 2,
                                          child: Image.asset(
                                              "assets/images/default.png")),
                                      Expanded(
                                          flex: 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                pro!.name.toString(),
                                                maxLines: 1,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text('Member',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      color: Colors.black))
                                            ],
                                          ))

                                      // SizedBox(height: 10.0),
                                    ],
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 130.0, right: 20.0, left: 20.0),
                            child: Container(
                                width: double.infinity,
                                height: Get.size.height / 3.5,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          offset: const Offset(0.0, 3.0),
                                          blurRadius: 15.0)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Email',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.black)),
                                          Text(
                                            pro!.email.toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tel. No',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.black)),
                                          Text(
                                            pro!.telephoneNumber.toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Text('Team Name',
                                      //         style: GoogleFonts.poppins(
                                      //             fontSize: 16,
                                      //             color: Colors.black)),
                                      //     Text(
                                      //       pro!.teamName.toString(),
                                      //       style: GoogleFonts.poppins(
                                      //           fontSize: 16,
                                      //           color: Colors.black,
                                      //           fontWeight: FontWeight.bold),
                                      //     ),
                                      //   ],
                                      // ),
                                      // const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Date Joined',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.black)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Text('Kompleks\nBerdaftar',
                                          //     style: GoogleFonts.poppins(
                                          //         fontSize: 16, color: Colors.black)),
                                          Text(
                                            pro!.createdAt.toString(),
                                            maxLines: 2,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const SizedBox(height: 50),
          const Text('version 1.0')
        ])));
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 300.0);
    path.quadraticBezierTo(size.width / 3, 300, size.width, 300.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
