import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        "images/loading.svg",
        fit: BoxFit.cover,
      ),
    );
  }
}
