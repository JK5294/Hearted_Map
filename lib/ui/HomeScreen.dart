import 'package:flutter/material.dart';
import 'package:hearted_map/ui/HomeScreen/HomeScreen2.dart';
import 'package:hearted_map/ui/IntroPage/IntroPage.dart';
import 'package:hearted_map/ui/MakeMapPage/YourMapPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MakeMapPage();
    // Scaffold(
    //   appBar: AppBar(),
    //   body: Text("Test"),
    // );
  }
}
