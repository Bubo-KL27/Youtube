import 'package:flutter/widgets.dart';

class Responsivelayout extends StatelessWidget {
  final Widget mobilebodyscreen;
  final Widget dekstopbodyscreen;

  const Responsivelayout({super.key, required this.dekstopbodyscreen, required this.mobilebodyscreen});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= mobilewidth) {
      return dekstopbodyscreen;
    } else {
      return mobilebodyscreen;
    }
  }
}


const mobilewidth = 600;
