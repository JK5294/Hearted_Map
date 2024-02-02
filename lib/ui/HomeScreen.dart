import 'package:flutter/material.dart';
import 'package:hearted_map/ui/IntroPage/IntroPage.dart';
import 'package:hearted_map/ui/Loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoadingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroPage();
  }
}
