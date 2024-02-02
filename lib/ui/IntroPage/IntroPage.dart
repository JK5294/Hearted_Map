import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        alignment: Alignment.center,
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
            margin: EdgeInsets.only(top: 300),
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

  _StarPage() {
    return Container(
      child: SvgPicture.asset(
        "images/loading1.svg",
        fit: BoxFit.cover,
      ),
    );
  }

  _IntroPage1() {
    return Container(
      child: SvgPicture.asset(
        "images/loading1.svg",
        fit: BoxFit.cover,
      ),
    );
  }

  _IntroPage2() {
    return Container(
      child: SvgPicture.asset(
        "images/loading2.svg",
        fit: BoxFit.cover,
      ),
    );
  }

  _IntroPage3() {
    return Container(
      child: SvgPicture.asset(
        "images/loading3.svg",
        fit: BoxFit.cover,
      ),
    );
  }

  _IntroPage4() {
    return Container(
      child: SvgPicture.asset(
        "images/loading4.svg",
        fit: BoxFit.cover,
      ),
    );
  }
}
