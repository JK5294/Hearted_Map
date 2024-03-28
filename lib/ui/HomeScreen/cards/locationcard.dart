import 'package:flutter/material.dart';
import 'package:hearted_map/ui/HomeScreen/HomeScreen2.dart';

class locationcard extends StatefulWidget {
  const locationcard({super.key});

  @override
  State<locationcard> createState() => _locationcardState();
}

class _locationcardState extends State<locationcard> {
  Container locationbutton() {
    return Container(
      width: 53 * w,
      height: h * 23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(w * 3),
      ),
      child: GestureDetector(
          child: Image.asset(
            "assets/png_picture/cards/locationcard.png",
            fit: BoxFit.fill,
          ),
          onTap: () {
            setState(() {
              havecard[0] = false;
            });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return locationbutton();
  }
}
