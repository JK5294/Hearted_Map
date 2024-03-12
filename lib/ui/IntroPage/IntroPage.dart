import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:hearted_map/theme/sh_theme.dart';
import 'package:hearted_map/ui/IntroPage/LoginPage.dart';
import 'package:hearted_map/ui/IntroPage/SignInPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _controller,
            children: [
              _IntroPage1(),
              _IntroPage2(),
              _IntroPage3(),
              _IntroPage4()
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: ExpandingDotsEffect(
                dotHeight: 5,
                dotWidth: 5,
              ),
            ),
          )
        ],
      ),
    );
  }

  _IntroPage1() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          child: SvgPicture.asset(
            "images/loading1.svg",
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                // color: Colors.black,
                ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text('打破社交次元壁！', style: TextSize_26),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "一款专为年轻人提供的交友个性交友APP",
                  style: TextSize14_B_O5,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  _IntroPage2() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          child: SvgPicture.asset(
            "images/loading2.svg",
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                // color: Colors.black,
                ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text('自我地图不一样的真我', style: TextSize_26),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: 266,
                  child: Text(
                    "不被单一标签定义，定制独家地图碎片，生成专属你的自我地图。",
                    style: TextSize14_B_O5,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  _IntroPage3() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          child: SvgPicture.asset(
            "images/loading3.svg",
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                // color: Colors.black,
                ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text('解锁你的soulmate', style: TextSize_26),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "打破刻板印象，寻找真正的灵魂伴侣。",
                  style: TextSize14_B_O5,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  _IntroPage4() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          child: SvgPicture.asset(
            "images/loading4.svg",
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                // color: Colors.black,
                ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      '双向奔赴更有意义',
                      style: TextSize_26,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "AR实景游戏机制，让线下dating充满乐趣。",
                      style: TextSize14_B_O5,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(SignInPage());
                  },
                  child: Text("注冊")),
              SizedBox(width: MediaQuery.of(context).size.width / 100),
              GestureDetector(
                  onTap: () {
                    Get.to(LoginPage());
                  },
                  child: Text("登入")),
            ],
          ),
        )
      ],
    );
  }
}
