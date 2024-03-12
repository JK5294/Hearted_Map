import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hearted_map/theme/theme.dart';

class backButton extends StatelessWidget {
  const backButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 20,
          ),
          decoration: BoxDecoration(
            color: SHColors.buttonBackGround,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
