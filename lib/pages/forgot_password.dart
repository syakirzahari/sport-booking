import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/pages/login.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controllerEmail = TextEditingController();
  bool hidePassword = true;

  @override
  void initState() {
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
      key: scaffoldKey,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          Align(
              child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo.png', width: 130),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Text(
                          "Sports Booking",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(
                          "Forgot Password",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildTextField("Enter Email Address"),
                      _buildResetBtn(),
                      _buildBackBtn(),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Text(
                          'All Right Reserved © 2022',
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )),
          ))
        ],
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 25,
            offset: Offset(0, 5),
            spreadRadius: -25,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextFormField(
        controller: _controllerEmail,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xff000912),
          ),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 25),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: Colors.black,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 75,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        validator: (usernameValue) {
          if (usernameValue!.isEmpty) {
            return 'Masukkan ID Pengguna';
          }
          // username = usernameValue;
          return null;
        },
      ),
    );
  }

  Widget _buildResetBtn() {
    return GestureDetector(
        onTap: () {
          Get.off(() => const LoginPage());
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15.0,
                offset: const Offset(0.0, 3.0),
              ),
            ],
            color: Colors.red[900],
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "RESET PASSWORD",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildBackBtn() {
    return GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15.0,
                offset: const Offset(0.0, 3.0),
              ),
            ],
            color: Colors.red[900],
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "BACK",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ));
  }
}
