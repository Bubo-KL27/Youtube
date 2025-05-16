import 'package:flutter/material.dart';
import 'package:youtubedemo/Screens/Dekstopscreen/dekstopyoutubehome.dart';
import 'package:youtubedemo/Screens/MobileSceen/mobileyoutubehome.dart';
import 'package:youtubedemo/widget/responsive.dart';

class Responsivechanges extends StatelessWidget {
  const Responsivechanges({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsivelayout(
        dekstopbodyscreen:Dekstopyoutubehome(),
        mobilebodyscreen: Mobileyoutubehome()),
    );
  }
}