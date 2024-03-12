import 'package:flutter/material.dart';
import 'package:hearted_map/theme/sh_colors.dart';

import '../../../theme/sh_theme.dart';

class bigTag extends StatefulWidget {
  final String label;
  bool active;
  int count;
  final ValueChanged<String> onTagTapped;
  bigTag({
    super.key,
    required this.label,
    this.active = false,
    this.count = 0,
    required this.onTagTapped,
  });

  @override
  State<bigTag> createState() => _bigTagState();
}

class _bigTagState extends State<bigTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (widget.count % 2 == 0) {
              widget.active = true;
              widget.onTagTapped(widget.label);
            } else {
              widget.active = false;
              widget.onTagTapped("${widget.label}*");
            }
            ;
            widget.count += 1;
          });
        },
        child: Container(
          width: 70,
          height: 25,
          child: Center(
              child: Text(
            widget.label,
            style: TextSize12_B,
          )),
          decoration: BoxDecoration(
              color: widget.active ? SHColors.buttonBackGround : SHColors.grey,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
