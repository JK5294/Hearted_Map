import 'package:flutter/material.dart';

class Slidedate extends StatelessWidget {
  final String label;
  final String photo;
  final Function()? onTap;
  const Slidedate({
    super.key,
    required this.label,
    required this.onTap,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(8, 20, 8, 0),
        child: Column(
          children: [
            ClipRRect(
              child: Container(
                height: 110,
                width: 110,
                child: Image.asset(
                  photo,
                  fit: BoxFit.cover,
                ),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 110,
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
