import 'package:flutter/material.dart';

late double _with;
late double _heigh;
double w = _with / 393;
double h = _heigh / 852;
List<double> wi1 = [
  w * 161,
  w * 138,
  w * 194,
  w * 70,
  w * 160,
  w * 131,
  w * 76,
  w * 210
];
List<double> he1 = [
  h * 160,
  h * 138,
  h * 209,
  h * 68,
  h * 175,
  h * 130,
  h * 95,
  h * 190
];
List<double> wi2 = [
  w * 87.72,
  w * 70,
  w * 150,
  w * 38.82,
  w * 126.62,
  w * 75.58,
  w * 48.07,
  w * 123
];
List<double> he2 = [
  h * 70,
  h * 54,
  h * 90,
  h * 32,
  h * 61,
  h * 57,
  h * 32.96,
  h * 110
];
List<String> background = [
  "assets/png_picture/ilands/l1.png",
  "assets/png_picture/ilands/l2.png",
  "assets/png_picture/ilands/l3.png",
  "assets/png_picture/ilands/l4.png",
  "assets/png_picture/ilands/l5.png",
  "assets/png_picture/ilands/l6.png",
  "assets/png_picture/ilands/l7.png",
  "assets/png_picture/ilands/l8.png",
];
List<String> ilands = [
  "assets/png_picture/ilands/a1.png",
  "assets/png_picture/ilands/a2.png",
  "assets/png_picture/ilands/a3.png",
  "assets/png_picture/ilands/a4.png",
  "assets/png_picture/ilands/a5.png",
  "assets/png_picture/ilands/a6.png",
  "assets/png_picture/ilands/a7.png",
  "assets/png_picture/ilands/a8.png",
];
List<String> title = ["美食达人", "电影爱好者", "风景摄影大师", "图书馆爱好者", "", ""];

List<List> lands = [wi1, he1, wi2, he2, background, ilands, title];

Container creatland(
    double distanc1,
    double distanc2,
    int n,
    AnimationController _controller,
    Animation<Offset> _offsetAnimation,
    String landtitle) {
  var landbutton = GestureDetector(
    child: AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
            offset: _offsetAnimation.value,
            child: Column(children: [
              SizedBox(
                height: distanc1,
              ),
              Container(
                height: lands[3][n - 1],
                width: lands[2][n - 1],
                child: Image.asset(
                  lands[5][n - 1],
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: distanc2,
              ),
              Text(landtitle)
            ]));
      },
    ),
    onTap: () {},
  );

  return Container(
    width: lands[0][n - 1],
    height: lands[1][n - 1],
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              lands[4][n - 1],
            ),
            fit: BoxFit.cover)),
    child: Center(
      child: Column(
        children: [landbutton],
      ),
    ),
  );
}
