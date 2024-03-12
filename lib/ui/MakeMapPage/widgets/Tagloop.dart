import 'package:flutter/material.dart';

class AutoScrollingListView extends StatefulWidget {
  final bool reverse;
  const AutoScrollingListView({Key? key, this.reverse = false})
      : super(key: key);

  @override
  _AutoScrollingListViewState createState() => _AutoScrollingListViewState();
}

class _AutoScrollingListViewState extends State<AutoScrollingListView> {
  final ScrollController _controller = ScrollController();
  final List<String> _tags = ['標籤1', '標籤2', '標籤3', '標籤4', '標籤5'];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      animateSlider();
    });
  }

  void animateSlider() {
    Future.delayed(const Duration(milliseconds: 50)).then((_) {
      if (_controller.offset < _controller.position.maxScrollExtent) {
        _controller.jumpTo(_controller.offset + 1);
      } else {
        _controller.jumpTo(0);
      }
      animateSlider();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Add this line
        reverse: widget.reverse,
        controller: _controller,
        itemCount: _tags.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 200, // Add this line
            alignment: Alignment.center,
            child: Text(
              _tags[index],
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
      ),
    );
  }
}
