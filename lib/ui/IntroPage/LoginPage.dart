import 'package:flutter/material.dart';
import 'package:hearted_map/ui/IntroPage/widgets/InputBar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _textEditingControllerName =
      TextEditingController();
  final TextEditingController _textEditingControllerPwd =
      TextEditingController();
  String _password = '';
  String _account = '';
  bool isobscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            InputBar(
              controller: _textEditingControllerName,
              prompt: "用户名/邮箱/電話",
              label: "邮箱",
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                GestureDetector(
                    onTap: () {
                      isobscureText = true;
                      setState(() {});
                    },
                    child: Icon(Icons.remove_red_eye)),
                InputBar(
                  label: "密碼",
                  controller: _textEditingControllerPwd,
                  isobscureText: isobscureText,
                  // suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
