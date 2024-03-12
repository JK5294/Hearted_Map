import 'package:flutter/material.dart';
import 'package:hearted_map/ui/IntroPage/IntroPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroPage();
    // Scaffold(
    //   appBar: AppBar(),
    //   body: Text("Test"),
    // );
  }
}
