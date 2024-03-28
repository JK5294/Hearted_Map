// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:hearted_map/models/makeMaptextList.dart';
import 'package:hearted_map/theme/theme.dart';
import 'package:hearted_map/ui/MakeMapPage/YourMapPage.dart';
import 'package:hearted_map/ui/MakeMapPage/widgets/backButton.dart';
import 'package:hearted_map/ui/MakeMapPage/widgets/bigTag.dart';
import 'package:hearted_map/ui/MakeMapPage/widgets/smalltagbuilder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EditMap extends StatefulWidget {
  const EditMap({super.key});

  @override
  State<EditMap> createState() => _EditMapState();
}

class _EditMapState extends State<EditMap> with SingleTickerProviderStateMixin {
  PageController _controller = PageController();
  ScrollController ListControlloer = ScrollController();
  late AnimationController Acontroller;
  late Animation<double> animation;
  List<bool> active = [true, false];
  late TabController _tabController;
  List<String> tagToNextPage = [];
  void initState() {
    super.initState();

    LocalDataTask.Instance.addListener(() {});
    var i = 0;
    Acontroller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 0.1).animate(Acontroller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (i < 3) {
            Acontroller.reverse();
          } else {
            Acontroller.reset();
            i = 0;
          }
          i += 1;
        } else if (status == AnimationStatus.dismissed && i < 3) {
          Acontroller.forward();
        }

        // _tabController = TabController(vsync: this, length: 6);
        // _tabController.addListener(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30, 30, 30, 15),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: WormEffect(
                dotHeight: 20,
                dotWidth: 150,
                activeDotColor: SHColors.red,
                dotColor: SHColors.grey,
              ),
            ),
          ),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    child: Text(
                  "Step 1",
                  style: TextStyle(
                      color: active[0] ? Colors.black : Colors.grey,
                      fontSize: 14,
                      fontFamily: 'Microsoft Himalaya'),
                )),
                // SizedBox(),
                Container(
                    child: Text(
                  "Step 2",
                  style: TextStyle(
                      color: active[1] ? Colors.black : Colors.grey,
                      fontSize: 14,
                      fontFamily: 'Microsoft Himalaya'),
                )),
                // SizedBox(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            height: MediaQuery.of(context).size.height * 0.6,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (index) {
                for (var i = 0; i < 2; i++) {
                  active[i] = false;
                }
                ;
                active[index] = true;
                setState(() {});
              },
              children: [
                _Page1(),
                _Page2(),
              ],
            ),
          ),
          Opacity(
            opacity: active[0] ? 0.0 : 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (active[1] == true) {
                    print("back");
                    Get.back();
                  } else {
                    Null;
                  }
                });
              },
              child: Container(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "生成地图",
                    style: TextSize_14,
                  ),
                ),
                decoration: BoxDecoration(
                  color: SHColors.buttonBackGround,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _Page1() {
    return Container(
      child: Container(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(30),
                child: SvgPicture.asset(
                  "images/takephoto.svg",
                  fit: BoxFit.fill,
                )),
            bigTag(
              items: LocalDataTask.Instance.tag,
              listreturn: (List<String> selectedItems) {
                setState(() {
                  tagToNextPage = selectedItems;
                  print('Selected items: $selectedItems');
                });
              },
            ),
            Container(
              margin: EdgeInsets.all(20),
              // color: Colors.red,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    print(tagToNextPage);
                    if (tagToNextPage.isEmpty) {
                      Acontroller.forward();
                    } else {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    }
                  });
                },
                child: AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: animation.value,
                        child: Container(
                          child: Text(
                            '下一頁',
                            style: TextSize12_R,
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Acontroller.dispose();
    super.dispose();
  }

  _Page2() {
    return Container(
      child: Container(
        child: Container(
          child: MultiSelectListView(
            tagToNextPage: tagToNextPage,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
      ),
    );
  }

  // _Page3() {
  //   return Container(
  //     child: Container(
  //       child: Column(
  //         children: [],
  //       ),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(
  //           color: Colors.grey.shade300,
  //           width: 2,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  _appBar() {
    return AppBar(
      leading: Container(child: backButton()),
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text(
        "创建你的地图",
        style: TextSize_18,
      ),
    );
  }
}
