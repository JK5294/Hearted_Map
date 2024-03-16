import 'package:hearted_map/controllers/task_controllers.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SignInPage> {
  @override
  TaskController taskController = TaskController();
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  String _password = '';
  String _account = '';
  // final _nameFocusNode = FocusNode();

  Widget build(BuildContext context) {
    final m = MediaQuery.of(context).size;

    return Container(
      height: m.height,
      width: m.width,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
              left: 25 / 393 * m.width,
              top: 66 / 852 * m.height,
              child: Container(
                width: 26 / 393 * m.width,
                height: 26 / 852 * m.height,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                          width: 26 / 393 * m.width,
                          height: 26 / 852 * m.height,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/a.png'),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              )),
          Positioned(
              top: 98 / 852 * m.height,
              left: 156 / 393 * m.width,
              child: Container(
                width: 80 / 393 * m.width,
                height: 80 / 852 * m.height,
                child: Image.asset(
                  "images/b.png",
                  fit: BoxFit.fill,
                ),
              )),
          Positioned(
            top: 212 / 852 * m.height,
            left: 170 / 393 * m.width,
            child: Container(
              width: 52 / 393 * m.width,
              height: 26 / 852 * m.height,
              child: Center(
                  child: Text(
                '注册',
                style: TextStyle(
                  color: Color(0xFF222534),
                  fontSize: 16,
                  fontFamily: 'Microsoft Himalaya',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              )),
            ),
          ),
          Positioned(
              top: 244 / 852 * m.height,
              left: 25 / 393 * m.width,
              child: Container(
                width: 343 / 393 * m.width,
                height: 64 / 852 * m.height,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 63 / 852 * m.height,
                      child: Container(
                        width: 343 / 393 * m.width,
                        height: 1 / 852 * m.height,
                        child: Stack(children: [
                          SizedBox(),
                        ]),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Text(
                        '昵称',
                        style: TextStyle(
                          color: Color(0xFF222534),
                          fontSize: 12,
                          fontFamily: 'Acme',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 33 / 852 * m.height,
                      child: Container(
                        width: 393 / 393 * m.width,
                        height: 20 / 852 * m.height,
                        child: Form(
                          // key: _formKey,

                          child: TextFormField(
                            //decoration: InputDecoration(hintText: '欣小萌'),
                            controller: _textEditingController2,

                            //focusNode: _nameFocusNode,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '请输入用户名';
                              }
                              return null;
                            },
                            //  onSaved: (value) {
                            // //   _name = value!;
                            // },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            top: 340 / 852 * m.height,
            left: 26 / 393 * m.width,
            child: Container(
              width: 343 / 393 * m.width,
              height: 58 / 852 * m.height,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 57 / 852 * m.height,
                    child: Container(
                      width: 343 / 393 * m.width,
                      height: 1 / 852 * m.height,
                      child: Stack(children: [
                        SizedBox(),
                      ]),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 29 / 852 * m.height,
                    child: Container(
                      width: 393 / 393 * m.width,
                      height: 20 / 852 * m.height,
                      child: Container(
                        width: 393 / 393 * m.width,
                        height: 20 / 852 * m.height,
                        child: Form(
                          // key: _formKey,

                          child: TextFormField(
                            controller: _textEditingController1,

                            //focusNode: _nameFocusNode,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '请输入用户名';
                              }
                              return null;
                            },
                            //  onSaved: (value) {
                            // //   _name = value!;
                            // },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Text(
                      '邮箱',
                      style: TextStyle(
                        color: Color(0xFF222534),
                        fontSize: 12,
                        fontFamily: 'Abel',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 328 / 393 * m.width,
                    top: 38 / 852 * m.height,
                    child: Container(
                      width: 15 / 393 * m.width,
                      height: 10.50 / 852 * m.height,
                      child: Stack(children: [
                        SizedBox(),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 419 / 852 * m.height,
            left: 26 / 393 * m.width,
            child: Container(
              width: 343 / 393 * m.width,
              height: 58 / 852 * m.height,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 57 / 852 * m.height,
                    child: Container(
                      width: 343 / 393 * m.width,
                      height: 1 / 852 * m.height,
                      child: Stack(children: [
                        SizedBox(),
                      ]),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 29 / 852 * m.height,
                    child: Container(
                      width: 393 / 393 * m.width,
                      height: 20 / 852 * m.height,
                      child: Container(
                        width: 393 / 393 * m.width,
                        height: 20 / 852 * m.height,
                        child: Form(
                          // key: _formKey,

                          child: TextFormField(
                            controller: _textEditingController1,

                            //focusNode: _nameFocusNode,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '请输入用户名';
                              }
                              return null;
                            },
                            //  onSaved: (value) {
                            // //   _name = value!;
                            // },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Text(
                      '密码',
                      style: TextStyle(
                        color: Color(0xFF222534),
                        fontSize: 12,
                        fontFamily: 'Abel',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 328 / 393 * m.width,
                    top: 38 / 852 * m.height,
                    child: Container(
                      width: 15 / 393 * m.width,
                      height: 10.50 / 852 * m.height,
                      child: Stack(children: [
                        SizedBox(),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 500 / 852 * m.height,
            left: 24 / 393 * m.width,
            child: Container(
              decoration: BoxDecoration(color: Color(0XFF799ADA)),
              width: 343 / 393 * m.width,
              height: 50 / 852 * m.height,
              child: TextButton(
                onPressed: () {
                  _password = _textEditingController1.text;
                  _account = _textEditingController2.text;
                  /* if ( _account = _textEditingController1.text;
        _formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // 执行提交操作或其他逻辑
                    
                  }*/
                  print(_password);
                  print(_account);
                  setState(() {
                    taskController.sendLGDataToBackend(_account, _password);
                  });
                },
                child: Text(
                  '登录',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 580 / 852 * m.height,
            left: 78 / 393 * m.width,
            child: Container(
              width: 58 / 393 * m.width,
              height: 58 / 852 * m.height,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/c.png'),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 580 / 852 * m.height,
            left: 168 / 393 * m.width,
            child: Container(
              height: 58 / 852 * m.height,
              width: 58 / 393 * m.width,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero),
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/d.png'),
                    //  fit: BoxFit.cover,
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: 580 / 852 * m.height,
            left: 257 / 393 * m.width,
            child: Container(
              height: 58 / 393 * m.width,
              width: 58 / 393 * m.width,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero),
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/e.png'),
                    // fit:BoxFit.cover,
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: 580 / 852 * m.height,
            left: 257 / 393 * m.width,
            child: Container(
              height: 58 / 393 * m.width,
              width: 58 / 393 * m.width,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero),
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/e.png'),
                    // fit:BoxFit.cover,
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: 709 / 852 * m.height,
            left: 165 / 393 * m.width,
            child: Container(
              width: 90 / 393 * m.width,
              height: 35 / 852 * m.height, // 增加容器的高度
              decoration: BoxDecoration(color: Colors.white),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  '已有账号',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 740 / 852 * m.height,
              left: 184 / 393 * m.width,
              child: Container(
                width: 49 / 393 * m.width,
                height: 40 / 852 * m.height,
                decoration: BoxDecoration(color: Colors.white),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      '登录',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )),
              ))
        ],
      ),
    );
  }
}
