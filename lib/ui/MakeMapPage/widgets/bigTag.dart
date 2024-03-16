import 'package:flutter/material.dart';
import 'package:hearted_map/models/makeMaptextList.dart';
import 'package:hearted_map/theme/sh_colors.dart';

import '../../../theme/sh_theme.dart';

class bigTag extends StatefulWidget {
  final List<String> items;
  ValueChanged<List<String>> listreturn;
  bool active;
  bigTag({
    super.key,
    required this.items,
    this.active = false,
    required this.listreturn,
  });

  @override
  State<bigTag> createState() => _bigTagState();
}

class _bigTagState extends State<bigTag> {
  final Set<String> _selectedItems = Set<String>();
  final LocalDataTask Task = LocalDataTask();
  List<String> tagToNextPage = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(widget.items.length, (index) {
        return Container(
          margin: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (_selectedItems.contains(widget.items[index])) {
                  _selectedItems.remove(widget.items[index]);
                } else {
                  _selectedItems.add(widget.items[index]);
                }
                widget.listreturn(_selectedItems.toList());
              });
            },
            child: Container(
              width: 85,
              height: 25,
              child: Center(
                  child: Text(
                widget.items[index],
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                  color: _selectedItems.contains(widget.items[index])
                      ? SHColors.buttonBackGround
                      : SHColors.grey,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        );
      }),
    );
  }
}
