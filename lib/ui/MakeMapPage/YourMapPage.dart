import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hearted_map/theme/theme.dart';
import 'package:hearted_map/ui/MakeMapPage/EditMap.dart';
import 'package:hearted_map/ui/MakeMapPage/widgets/Slidedate.dart';
import 'package:hearted_map/ui/MakeMapPage/widgets/Tagloop.dart';
import 'package:hearted_map/ui/MakeMapPage/widgets/portraitBar.dart';

class MakeMapPage extends StatefulWidget {
  const MakeMapPage({super.key});

  @override
  State<MakeMapPage> createState() => _MakeMapPageState();
}

class _MakeMapPageState extends State<MakeMapPage> {
  // final TaskController _taskController = Get.put(TaskController());
  final double portrait = 3;
  final PageController controller = PageController(
    viewportFraction: 0.4,
    initialPage: 2,
  );
  final PageController mapController = PageController();
  int selectedIndex = 0;
  final List<String> imagePaths = [
    "images/test1.png",
    "images/test2.png",
    "images/test3.png",
    "images/test4.png",
    "images/test5.png",
    "images/test6.png",
    "images/test7.png",
    "images/test8.png",
    "images/test9.png",
  ];
  final List<Widget> MapList1 = [];
  final List<Widget> MapList2 = [];
  final List<Widget> MapList3 = [];
  final String name = "王小明";
  final bool gender = false;
  final String location = "天津，本科";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Column(
        children: [
          _portraitChange(),
          _information(),
          _Map(),
          AutoScrollingListView(reverse: false),
          AutoScrollingListView(reverse: true),
          AutoScrollingListView(reverse: false),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.abc_rounded), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit_sharp), label: "")
      ]),
    );
  }

  _information() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  name,
                  style: TextSize_24,
                ),
              ),
              Container(
                child: Icon(
                  gender ? Icons.female : Icons.male,
                  color: Color.fromARGB(255, 121, 154, 218),
                ),
              ),
            ],
          ),
        ),
        Text(
          location,
          style: TextSize12_B,
        )
      ],
    );
  }

  _Map() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "一层地图",
                style: TextSize14_B_W700,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(EditMap());
              },
              child: Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "编辑地图",
                  style: TextSize12_Blue,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  _portraitChange() {
    return Container(
      padding: EdgeInsets.all(10),
      // color: Colors.red,
      height: 300,
      child: ListWheelScrollViewX(
        controller: FixedExtentScrollController(initialItem: 1),
        itemExtent: 170,
        onSelectedItemChanged: (index) {
          // Handle selected item change
          // setState(() {
          //   selectedIndex = index;
          // });
          print('Selected item index: $index');
        },
        images: imagePaths
            .map((path) => Image.asset(path, fit: BoxFit.fill))
            .toList(),
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: SvgPicture.asset(
        "images/Robot.svg",
        fit: BoxFit.scaleDown,
        width: 25,
        height: 25,
      ),
      title: Text(
        "个人虚拟形象创建",
        style: TextSize_18,
      ),
      actions: <Widget>[
        Center(
          child: GestureDetector(
            onTap: () {
              print("done");
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
              child: Text(
                "编辑基本信息",
                style: TextSize12_Blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
