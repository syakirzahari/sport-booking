// ignore_for_file: unnecessary_new

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sport_booking/pages/slider/SliderWidget/lib/Models/page_bubble_view_model.dart';

/// This class contains the UI for page bubble.
class PageBubble extends StatelessWidget {
  //view model
  final PageBubbleViewModel viewModel;

  //Constructor
  // ignore: use_key_in_widget_constructors
  const PageBubble({
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 65.0,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(0.5),
          child: new Container(
            width:
                60.0, //This method return in between values according to active percent.
            height: 4.0,
            decoration: new BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(0.0)),
              //Alpha is used to create fade effect for background color
              color:
                  viewModel.isHollow ? Colors.white24 : const Color(0xFF73AE5B),
              border: new Border.all(
                color: viewModel.isHollow
                    ? viewModel.bubbleBackgroundColor.withAlpha(
                        (0xFF * (0.1 - viewModel.activePercent)).round())
                    : Colors.white10,
                width: 2.0,
              ), //Border
            ), //BoxDecoration
            child: new Opacity(
              opacity: viewModel.activePercent,
              child: (viewModel.iconAssetPath != "")
                  // ignore: conflicting_dart_import
                  ? new Image.asset(
                      viewModel.iconAssetPath,
                      color: viewModel.iconColor,
                    )
                  : new Container(),
            ), //opacity
          ), //Container
        ), //Padding
      ), //Center
    ); //Container
  }
}
