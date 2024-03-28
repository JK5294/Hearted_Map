import 'package:flutter/material.dart';
import 'package:hearted_map/theme/sh_colors.dart';

class SecondMap extends StatelessWidget {
  const SecondMap({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
          color: SHColors.grey,
          child: Icon(
            Icons.add,
            size: 20,
          )),
    );
  }
}
