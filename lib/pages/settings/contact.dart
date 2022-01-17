import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/widgets/navbar.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerContent = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red[800], //change your color here
        ),
        title: Text(
          'Contact Us',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    _buildText(_controllerTitle, 'Enter Title', 2),
                    const SizedBox(height: 10.0),
                    _buildText(_controllerContent, 'Enter Enquiry', 8),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          String title = _controllerTitle.text;
                          String desc = _controllerContent.text;

                          if (validateAndSave()) {
                            setState(() {
                              _isLoading = true;
                            });

                            apiService.sendFeedback(title, desc).then((value) {
                              if (value['success'] == true) {
                                setState(() {
                                  _isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(value['message'].toString()),
                                  ),
                                );
                                Get.offAll(() => const NavBarPage());
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
                                      "SEND",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Get.back();
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
                            color: Colors.black,
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
                        )),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hotline: 03-3333333',
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 14),
                          ),
                          Text(
                            'Email: sportcms2022@gmail.com',
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 14),
                          ),
                          Text(
                            'Address: Shah Alam, Selangor',
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                    )
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

  Widget _buildText(TextEditingController controller, String label, int line) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black,
        //     blurRadius: 10,
        //     offset: Offset(0, 5),
        //     spreadRadius: -25,
        //   ),
        // ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextFormField(
        controller: controller,
        maxLines: line,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xff000912),
          ),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 25),
          hintText: label,
          hintStyle: const TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(
            Icons.document_scanner_outlined,
            color: Colors.black,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 75,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        validator: (passwordValue) {
          if (passwordValue!.isEmpty) {
            return 'Enter Enquiry Title';
          }
          // username = usernameValue;
          return null;
        },
      ),
    );
  }
}
