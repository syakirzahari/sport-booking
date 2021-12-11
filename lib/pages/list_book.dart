import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListBookPage extends StatefulWidget {
  const ListBookPage({Key? key}) : super(key: key);

  @override
  _ListBookPageState createState() => _ListBookPageState();
}

class _ListBookPageState extends State<ListBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Booking',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 5.0,
          ),

          ///
          /// Custom tab bar
          ///
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize:
                      const Size.fromHeight(42.0), // here the desired height
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    title: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(color: Colors.red),
                          color: Colors.red[200]),
                      child: TabBar(
                        indicatorColor: const Color(0xFF31A1C9),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white54,
                        indicator: ShapeDecoration.fromBoxDecoration(
                            BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                color: Colors.red[800])),
                        tabs: const [
                          Tab(
                            child: Text(
                              "Active",
                              style: TextStyle(
                                fontSize: 15.0,
                                // fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Tab(
                              child: Text(
                            "Upcoming",
                            style: TextStyle(
                              fontSize: 15.0,
                              // fontWeight: FontWeight.w300,
                            ),
                          )),
                          Tab(
                              child: Text(
                            "Past",
                            style: TextStyle(
                              fontSize: 15.0,
                              // fontWeight: FontWeight.w300,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),

                ///
                /// Body tabBar
                ///
                body: const TabBarView(
                  children: [
                    Align(
                        child: Text(
                      "My Booking",
                      style: TextStyle(
                          fontFamily: "Sofia",
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    )),
                    Align(
                        child: Text(
                      "Upcoming",
                      style: TextStyle(
                          fontFamily: "Sofia",
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    )),
                    Align(
                        child: Text(
                      "Past",
                      style: TextStyle(
                          fontFamily: "Sofia",
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
