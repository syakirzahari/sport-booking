// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:sport_booking/pages/slider/SliderWidget/lib/Clipper/circular_reveal_clipper.dart';

/// This class reveals the next page in the circular form.

class PageReveal extends StatelessWidget {
  final double revealPercent;
  final Widget child;

  //Constructor
  // ignore: use_key_in_widget_constructors
  const PageReveal({required this.revealPercent, required this.child});

  @override
  Widget build(BuildContext context) {
    //ClipOval cuts the page to circular shape.
    return new ClipOval(
      clipper: new CircularRevealClipper(revealPercent: revealPercent),
      child: child,
    );
  }
}
