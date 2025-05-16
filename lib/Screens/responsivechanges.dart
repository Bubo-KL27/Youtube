import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtubedemo/Screens/Dekstopscreen/dekstopyoutubehome.dart';
import 'package:youtubedemo/Screens/MobileSceen/mobileyoutubehome.dart';

class Responsivechanges extends StatelessWidget {
  const Responsivechanges({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kIsWeb
          ? Dekstopyoutubehome()
          : Mobileyoutubehome(),
    );
  }
}