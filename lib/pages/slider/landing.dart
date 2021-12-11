import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_booking/pages/login.dart';
import 'package:sport_booking/pages/slider/SliderWidget/lib/Models/page_view_model.dart';
import 'package:sport_booking/pages/slider/SliderWidget/lib/intro_views_flutter.dart';

class LandingSlider extends StatefulWidget {
  const LandingSlider({Key? key}) : super(key: key);

  @override
  _LandingSliderState createState() => _LandingSliderState();
}

var _fontHeaderStyle = const TextStyle(
    fontFamily: "Sofia",
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
    color: Colors.black87,
    letterSpacing: 1.5);

var _fontDescriptionStyle = const TextStyle(
    fontFamily: "Sofia",
    fontSize: 17.0,
    color: Colors.black26,
    fontWeight: FontWeight.w400);

final pages = [
  PageViewModel(
      pageColor: Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Choose Preferred Sport',
        style: _fontHeaderStyle,
      ),
      body: SizedBox(
        height: 500.0,
        child: Text('You can choose any sports, \nthat you want',
            textAlign: TextAlign.center, style: _fontDescriptionStyle),
      ),
      mainImage: Image.asset(
        'assets/images/landing1.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      iconImageAssetPath: ''),
  PageViewModel(
      pageColor: Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Book Your Slot',
        style: _fontHeaderStyle,
      ),
      body: SizedBox(
        height: 500.0,
        child: Text(
            'Select your spot at the desire location \ndont worry because we have a list\nfor you',
            textAlign: TextAlign.center,
            style: _fontDescriptionStyle),
      ),
      mainImage: Image.asset(
        'assets/images/landing2.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      iconImageAssetPath: '',
      bubble: null),
  PageViewModel(
      pageColor: Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Ready to Enjoy',
        style: _fontHeaderStyle,
      ),
      body: SizedBox(
        height: 500.0,
        child: Text('That is it!\nJust enjoy with your friends',
            textAlign: TextAlign.center, style: _fontDescriptionStyle),
      ),
      mainImage: Image.asset(
        'assets/images/landing3.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      iconImageAssetPath: '',
      bubble: null,
      textStyle: null),
];

class _LandingSliderState extends State<LandingSlider> {
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      pages,
      pageButtonsColor: Colors.black45,
      skipText: Text(
        "SKIP",
        style: _fontDescriptionStyle.copyWith(
            color: Colors.red[800],
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0),
      ),
      doneText: Text(
        "DONE",
        style: _fontDescriptionStyle.copyWith(
            color: Colors.red[800],
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0),
      ),
      onTapDoneButton: () {
        Get.off(() => const LoginPage());
      },
      onTapSkipButton: () {},
      pageButtonFontFamily: '',
    );
  }
}
