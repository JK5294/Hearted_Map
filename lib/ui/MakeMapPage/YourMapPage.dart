import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hearted_map/models/makeMaptextList.dart';
import 'package:hearted_map/theme/theme.dart';
import 'package:hearted_map/ui/HomeScreen/HomeScreen2.dart';
import 'package:hearted_map/ui/MakeMapPage/EditMap.dart';
import 'package:hearted_map/ui/MakeMapPage/widgets/Slidedate.dart';
import 'package:hearted_map/ui/MakeMapPage/widgets/Tagloop.dart';
import 'package:hearted_map/ui/MakeMapPage/widgets/addSecondMap.dart';
import 'package:hearted_map/ui/MakeMapPage/widgets/portraitBar.dart';
import 'package:hearted_map/ui/SecondMap/AddSecondMap.dart';

class MakeMapPage extends StatefulWidget {
  MakeMapPage({super.key});

  final GlobalKey globalKey = GlobalKey();

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

  late List<Widget> MapList1 = [];
  late List<Widget> MapList2 = [];
  late List<Widget> MapList3 = [];
  final String name = "王小明";
  final bool gender = false;
  final String location = "天津，本科";
  late Widget container;
  late int activeIndex = 0;

  final List<IconData> iconList = [
    Icons.home_filled,
    Icons.map_rounded,
    // Icons.add,
    Icons.notifications_none,
    Icons.perm_identity_outlined
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      var list = LocalDataTask.Instance.selectedWidget;
      if (list.isNotEmpty) {
        if (list.length / 3 >= 5) {
          final chunkSize = list.length ~/ 3;
          MapList1 = list.sublist(0, chunkSize);
          MapList2 = list.sublist(chunkSize, 2 * chunkSize);
          MapList3 = list.sublist(2 * chunkSize);
        } else if (list.length / 2 >= 5) {
          final chunkSize = list.length ~/ 2;
          MapList1 = list.sublist(0, chunkSize);
          MapList2 = list.sublist(chunkSize);
        } else {
          MapList1 = list.sublist(0, list.length);
        }
      }
      container = list.isNotEmpty
          ? Column(children: [
              AutoScrollingListView(tags: MapList1, reverse: false),
              AutoScrollingListView(tags: MapList2, reverse: true),
              AutoScrollingListView(tags: MapList3, reverse: false),
            ])
          : Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 30,
                      color: Colors.grey.shade600,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Get.to(EditMap());
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Container(
                            margin: EdgeInsets.all(15),
                            child: Text(
                              "新增地图",
                              style: TextStyle(color: Colors.white),
                            )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: SHColors.buttonBackGround),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: SHColors.grey,
                    borderRadius: BorderRadius.circular(20)),
              ),
            );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Column(
        children: [_portraitChange(), _information(), _Map(), container],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: SHColors.selectedColor,
          splashColor: Colors.white,
          shape: CircleBorder(
              side: BorderSide(
            width: 1,
            color: Colors.white,
          )),
          onPressed: () => Get.to(AddSecondMap()),
          child: Icon(
            Icons.add,
            color: Colors.white,
            // size: 10,
          )),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: SHColors.grey,
        icons: iconList,
        activeIndex: activeIndex,
        activeColor: SHColors.selectedColor,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) {
          setState(() {
            switch (index) {
              case 0:
                // Get.to(Homepage());
                activeIndex = index;
              case 1:
                Get.to(MakeMapPage());
                activeIndex = index;
              case 2:
                // Get.to(AddSecondMap());
                activeIndex = index;
              case 3:
                // Get.to(ChatPage());
                print("ChatPage()");
                activeIndex = index;
              case 4:
                // Get.to(PersonalPage());
                activeIndex = index;
            }
          });
        },
      ),
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
              onTap: () async {
                await Get.to(EditMap());
                setState(() {});
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
