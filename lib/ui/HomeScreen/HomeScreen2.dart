import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hearted_map/theme/sh_colors.dart';
import 'package:hearted_map/ui/HomeScreen/cards/iland.dart';
import 'package:hearted_map/ui/HomeScreen/cards/locationcard.dart';
import 'package:hearted_map/ui/HomeScreen/cards/othercard.dart';
import 'package:hearted_map/main.dart';
import 'package:hearted_map/ui/MakeMapPage/YourMapPage.dart';
import 'package:hearted_map/ui/SecondMap/AddSecondMap.dart';

List<bool> havecard = [
  true,
  false,
]; //locationcard,othercard

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late int activeIndex = 0;
  TextEditingController textcontroller = TextEditingController();
  List<Widget> cards = [locationcard(), othercard()];
  List<String> landtitle = [
    "美食达人",
    "电影爱好者",
    "风景摄影大师",
    "图书馆爱好者",
    "点我开启第二层地图",
    ""
  ];
  final List<IconData> iconList = [
    Icons.home_filled,
    Icons.map_rounded,
    Icons.notifications_none,
    Icons.perm_identity_outlined
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    _controller.repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, w * 15),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInBack));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Container _appbar() {
    return Container(
        width: w * 393,
        height: h * 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
            child: Column(children: [
          SizedBox(
            height: h * 30,
          ),
          Text(
            "我的地图",
            style: TextStyle(fontSize: h * 23, fontWeight: FontWeight.w100),
          )
        ])));
  }

  Container textfield(List<bool> havecard, List<Widget> cards) {
    List<int> num = [0];
    List<Widget> putcard(
        List<bool> havecard, List<Widget> cards, List<int> num) {
      List<Widget> _list = [];
      for (int i = 0; i < havecard.length; i++) {
        if (havecard[i] == true) {
          _list.add(cards[i]);
          _list.add(SizedBox(
            width: w * 5,
          ));
        }
      }
      num[0] = _list.length;
      return _list;
    }

    var searchbutton = GestureDetector(
      child: Container(
        width: w * 30,
        height: h * 30,
        child: Image.asset(
          "images/homescreen/addcardbutton1.png",
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {},
    );

    return Container(
      height: h * 42,
      width: w * 345,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10 * h),
        border: Border.all(color: Colors.blue),
      ),
      child: Row(children: [
        SizedBox(
          width: w * 7,
        ),
        Row(
          children: putcard(havecard, cards, num),
        ),
        Container(
          width: w * (300 - num[0] * 29),
          child: TextField(),
        ),
        searchbutton,
      ]),
    );
  }

  Container addbubule() {
    var arrowbutton = GestureDetector(
      child: Container(
        width: w * 34,
        height: h * 32,
        child: Image.asset("images/homescreen/arrowbutton.png"),
      ),
      onTap: () {},
    );

    return Container(
      width: w * 329,
      height: h * 75,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/homescreen/addbuble.png"))),
      child: Stack(
        children: [
          Positioned(
              top: h * 27,
              left: w * 35,
              child: Row(
                children: [
                  Text(
                    "随时增加小碎片，丰富你的内心世界",
                    style: TextStyle(fontSize: w * 14),
                  ),
                  SizedBox(
                    width: w * 6,
                  ),
                  arrowbutton,
                ],
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("我的地图"),
        ),
        body: Container(
          width: w * 393,
          height: h * 850,
          color: Colors.white,
          child: (Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: h * 0,
                left: w * 24,
                child: Center(
                  child: textfield(havecard, cards),
                ),
              ),
              Positioned(
                  left: w * 20,
                  top: h * 90,
                  child: creatland(h * 30, h * 2, 1, _controller,
                      _offsetAnimation, landtitle[0])),
              Positioned(
                  left: w * 240,
                  top: h * 80,
                  child: creatland(h * 24, h * 2, 2, _controller,
                      _offsetAnimation, landtitle[1])),
              Positioned(
                  top: h * 266,
                  left: 0,
                  child: creatland(h * 45, h * 2, 3, _controller,
                      _offsetAnimation, landtitle[2])),
              Positioned(
                  top: h * 216,
                  left: w * 165,
                  child: creatland(
                      h * 10, h * 2, 4, _controller, _offsetAnimation, "")),
              Positioned(
                  top: h * 240,
                  right: 0,
                  child: creatland(h * 45, h * 2, 5, _controller,
                      _offsetAnimation, landtitle[3])),
              Positioned(
                  bottom: h * 123,
                  right: w * 65,
                  child: creatland(
                      h * 34, h * 2, 6, _controller, _offsetAnimation, "")),
              Positioned(
                  bottom: h * 44,
                  right: 0,
                  child: creatland(
                      h * 26, h * 2, 7, _controller, _offsetAnimation, "")),
              Positioned(
                  bottom: h * 10,
                  left: 0,
                  child: creatland(h * 10, h * 2, 8, _controller,
                      _offsetAnimation, landtitle[4])),
            ],
          )),
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
                  Get.to(Homepage());
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
      ),
    );
  }
}
