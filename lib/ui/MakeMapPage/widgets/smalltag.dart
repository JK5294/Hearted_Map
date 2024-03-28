import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hearted_map/theme/theme.dart';

class smalltag extends StatelessWidget {
  final String image;
  final String label;
  final Color color;
  final List colorList;
  final bool isSelected;
  final int index;
  const smalltag({
    super.key,
    required this.image,
    required this.label,
    required this.color,
    this.isSelected = false,
    required this.colorList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // SizedBox(width: 10,),
          Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.scaleDown,
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(5),
              child: Text(
                label,
                style: TextSize_14,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: isSelected ? color : colorList[index]![0],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5), // 調整陰影位置
            ),
          ]),
    );
  }
}
