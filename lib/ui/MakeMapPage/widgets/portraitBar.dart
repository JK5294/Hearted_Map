import 'package:flutter/material.dart';

class ListWheelScrollViewX extends StatefulWidget {
  // final Widget Function(BuildContext, int) builder;
  final FixedExtentScrollController controller;
  final double itemExtent;
  final double diameterRatio;
  final void Function(int) onSelectedItemChanged;
  final List<Widget> images;

  ListWheelScrollViewX({
    super.key,
    // required this.builder,
    required this.itemExtent,
    required this.controller,
    required this.onSelectedItemChanged,
    this.diameterRatio = 100000,
    required this.images,
  });

  @override
  _ListWheelScrollViewXState createState() => _ListWheelScrollViewXState();
}

class _ListWheelScrollViewXState extends State<ListWheelScrollViewX> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3, // Rotate 90 degrees to make it horizontal
      child: ListWheelScrollView.useDelegate(
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
          widget.onSelectedItemChanged.call(index);
        },
        controller: widget.controller,
        itemExtent: widget.itemExtent,
        diameterRatio: widget.diameterRatio,
        physics: FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final isSelected = index == _selectedIndex;
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isSelected ? 1.0 : 0.5,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 200),
                scale: isSelected ? 1.1 : 0.8,
                child: RotatedBox(
                  quarterTurns: 1, // Rotate back to original orientation
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5,
                          offset: Offset(5, 15),
                          spreadRadius: 0.01,
                          blurStyle: BlurStyle.normal,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: widget.images[(widget.images.length == 0)
                            ? index % widget.images.length
                            : index]),
                  ),
                ),
              ),
            );
          },
          childCount: widget.images.length,
        ),
      ),
    );
  }
}
