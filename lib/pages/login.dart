import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/auth.dart';
import 'package:sport_booking/pages/forgot_password.dart';
import 'package:sport_booking/pages/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sport_booking/widgets/navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool hidePassword = true;
  bool _isLoading = false;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // DO STUFF
    super.dispose();
  }

  //Login
  Future<User> login(String email, String password) async {
    final response =
        await http.post(Uri.parse(ApiService.baseUrl + "/login"), body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      // final detail = json.decode(response.body);

      setState(() {
        _isLoading = false;
      });

      return User.fromJson(json.decode(response.body));
    } else {
      setState(() {
        _isLoading = false;
      });

      Get.defaultDialog(
        title: 'Log In Error',
        middleText: 'Please check your Email Address/Password',
        textConfirm: "OK",
        buttonColor: Colors.red,
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        },
      );
      // print(response.body);
      throw Exception('Failed to load data!');
    }
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
                      _buildTextField("Email Address"),
                      _buildTextFieldPassword("Password"),
                      _buildLoginBtn(),
                      _buildForgotPasswordBtn(),
                      _buildRegisterBtn(),
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
            return 'Enter Email Address';
          }
          // username = usernameValue;
          return null;
        },
      ),
    );
  }

  Widget _buildTextFieldPassword(String hint) {
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
        controller: _controllerPassword,
        obscureText: hidePassword,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xff000912),
          ),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 25),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            color: Colors.black.withOpacity(0.4),
            icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(
            Icons.lock_outline,
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
        validator: (passwordValue) {
          if (passwordValue!.isEmpty) {
            return 'Enter Password';
          }
          // username = usernameValue;
          return null;
        },
      ),
    );
  }

  Widget _buildLoginBtn() {
    return GestureDetector(
      onTap: () {
        if (validateAndSave()) {
          setState(() {
            _isLoading = true;
          });
          login(_controllerEmail.text, _controllerPassword.text)
              .then((value) async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();

            if (value.token != null) {
              // ignore: avoid_print
              print('token: ' + value.token.toString());

              sharedPreferences.setString('token', value.token.toString());
              sharedPreferences.setString('id', value.user!.id.toString());
              sharedPreferences.setString('name', value.user!.name.toString());
              sharedPreferences.setString(
                  'email', value.user!.email.toString());
              sharedPreferences.setString(
                  'phone', value.user!.telephoneNumber.toString());

              Get.off(() => const NavBarPage());
            } else {
              setState(() {
                _isLoading = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Email/Password is incorrect'),
                ),
              );
            }
          });
        }
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      "LOG IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          )),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Get.to(() => const ForgotPasswordPage()),
        // padding: const EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return GestureDetector(
      // ignore: avoid_print
      onTap: () => Get.to(() => const RegisterPage()),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Don\'t have an Account? ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'Register now',
                style: TextStyle(
                  color: Colors.red[900],
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
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
