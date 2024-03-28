import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hearted_map/ui/Loading.dart';
import 'package:hearted_map/ui/MakeMapPage/YourMapPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    double _with = MediaQuery.of(context).size.width;
    double _heigh = MediaQuery.of(context).size.height;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MakeMapPage(),
      // LoadingPage(),
    );
  }
}
