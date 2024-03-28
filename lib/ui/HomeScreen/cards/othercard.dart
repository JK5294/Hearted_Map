import 'package:flutter/material.dart';

late double _with;
late double _heigh;
double w = _with / 393;
double h = _heigh / 852;

class othercard extends StatelessWidget {
  const othercard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 53 * w,
        height: 23 * h,
        decoration: BoxDecoration(color: Colors.black));
  }
}
