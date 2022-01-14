import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/feedback.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  ApiService apiService = ApiService();
  DataFeedback? pro;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red[800], //change your color here
        ),
        title: Text(
          'About Us',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: apiService.getPrivacyPolicy(),
            builder:
                (BuildContext context, AsyncSnapshot<DataFeedback?> snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                pro = snapshot.data;
                if (pro == null) {
                  return const Center(
                    child: Text("No Data"),
                  );
                } else {
                  // return Container();
                  return Text(
                    pro!.content.toString(),
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 14),
                  );
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
}
