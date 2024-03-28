import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hearted_map/ui/Loading.dart';
import 'package:hearted_map/ui/MakeMapPage/YourMapPage.dart';

void main() {
  runApp(MyApp());
}

late double _with;
late double _heigh;
double w = _with / 393;
double h = _heigh / 852;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    _with = MediaQuery.of(context).size.width;
    _heigh = MediaQuery.of(context).size.height;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MakeMapPage(),

      // LoadingPage(),
    );
  }
}
