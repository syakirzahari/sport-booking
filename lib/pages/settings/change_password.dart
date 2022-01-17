import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/pages/settings/profile.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword =
      TextEditingController();
  bool _isLoading = false;
  bool hidePassword = true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red[800], //change your color here
        ),
        title: Text(
          'Change Password',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    _buildTextPassword(
                        _controllerPassword, 'Enter New Password'),
                    const SizedBox(height: 10.0),
                    _buildTextConfirmPassword(
                        _controllerConfirmPassword, 'Confirm Your Password'),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Text(
                          '**Password must have at least 1 uppercase, 1 lowercase, 1 number and minimum 8 characters',
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.italic,
                            fontSize: 10,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          String cpass = _controllerConfirmPassword.text;

                          if (validateAndSave()) {
                            setState(() {
                              _isLoading = true;
                            });

                            apiService.updatePassword(cpass).then((value) {
                              if (value['data'] == "success") {
                                setState(() {
                                  _isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(value['message'].toString()),
                                  ),
                                );
                                Get.off(() => const ProfilePage());
                              } else {
                                setState(() {
                                  _isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Error. Please Try Again'),
                                  ),
                                );
                              }
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
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
                              child: _isLoading == true
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "SAVE",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                          ),
                        ))
                  ],
                ))),
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

  Widget _buildTextPassword(TextEditingController controller, String label) {
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
        controller: controller,
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
          hintText: label,
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
            return 'Enter New Password';
          }
          // username = usernameValue;
          return null;
        },
      ),
    );
  }

  Widget _buildTextConfirmPassword(
      TextEditingController controller, String label) {
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
        controller: controller,
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
          hintText: label,
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Confirm Your Password';
          }
          if (_controllerPassword.text != _controllerConfirmPassword.text) {
            return "Password confirmation does not match";
          }
          return null;
        },
      ),
    );
  }
}
