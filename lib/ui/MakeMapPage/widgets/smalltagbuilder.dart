import 'package:flutter/material.dart';
import 'package:hearted_map/models/makeMaptextList.dart';

class MultiSelectListView extends StatefulWidget {
  @override
  _MultiSelectListViewState createState() => _MultiSelectListViewState();
}

class _MultiSelectListViewState extends State<MultiSelectListView> {
  final LocalDataTask tagChecklist = LocalDataTask();
  final List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5'
  ];
  final Set<String> _selectedItems = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: ListView.builder(
        itemCount: _items.length,
        // scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = _items[index];
          return InkWell(
            onTap: () {
              setState(() {
                if (_selectedItems.contains(item)) {
                  _selectedItems.remove(item);
                } else {
                  _selectedItems.add(item);
                }
              });
            },
            child: Container(
              color: _selectedItems.contains(item) ? Colors.blue : null,
              child: ListTile(
                title: Text(item),
              ),
            ),
          );
        },
      ),
    );
  }
}
