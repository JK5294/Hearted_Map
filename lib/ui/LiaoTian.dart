import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:flutter_aliyun_oss/flutter_aliyun_oss.dart'; // 用起来有问题
//import 'dart:io'; // 暂时不用
//import 'package:http/http.dart' as http; // 暂时不用
//import 'package:crypto/crypto.dart'; // 暂时不用
import 'dart:convert'; 
class Message {
  final String text;
  final bool isMe;
  final String userAvatar;

  Message({required this.text, required this.isMe, required this.userAvatar});
}

class Liaotian extends StatefulWidget {
  const Liaotian({Key? key}) : super(key: key);

  @override
  _LiaotianState createState() => _LiaotianState();
}

class _LiaotianState extends State<Liaotian> {
  TextEditingController _controller = TextEditingController(); // 输入框
  ScrollController _scrollController = ScrollController(); // 键盘

  String data = '';
  String text = '';
  final channel = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org'));
  // 保存用户ID
  String userId = ''; // 储存获取的用户id
  String currentChatUserId = ''; // 储存对方id
  double _opacity = 1.0; // add透明度
  final FocusNode _focusNode = FocusNode();

  // 图片功能
  final ImagePicker _picker = ImagePicker();
  Future<void> openGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
  // 在这里处理用户选择的图片文件，比如显示在界面上或上传到服务器
  final bytes = await pickedFile.readAsBytes(); // 读取图片文件为字节流
  String base64Image = base64Encode(bytes); // 将字节流编码为base64字符串
  channel.sink.add(base64Image); // 以base64形式传递图片数据
}
  }

  final List<Message> messages = [
   
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);

    _controller.text = text;
    int m=messages.length;

    channel.stream.listen((receivedData) {
      print('接收到: $receivedData');

      // 创建一个新的 Message 对象，并将数据填充到其中
      Message newMessage = Message(
        text: receivedData,
        isMe: true,
        userAvatar: 'images/hh.png',
      );

      setState(() {if(m==0){
        m++; // 将新消息添加到消息列表中
    }
    else{messages.add(newMessage);}
    });
    });

    // 等待 ListView.builder 加载完成
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(0.0); // 确保页面恢复原来位置
    });
  
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      // 当焦点在输入框中时，将透明度设置为0，否则设置为1.0。
      _opacity = _focusNode.hasFocus ? 0 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final m = MediaQuery.of(context).size;
    final h = m.height / 852;
    final w = m.width / 393;

    void _sendMessage() {
      String message = _controller.text;
      if (message.isNotEmpty) {
        channel.sink.add('$message'); // 发送消息
        setState(() {
          text = '';
          _controller.clear();
        });
      }
    }

    return GestureDetector(
      onTap: () {
        // 隐藏键盘
        FocusScope.of(context).unfocus();
        _scrollController.jumpTo(0.0);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            width: m.width,
            height: m.height,
            child: Stack(
              children: [
                Positioned(
                  top: 45 * h,
                  left: 8 * w,
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: SizedBox(height: 20 * h),
                            content: Container(
                              height: 80 * h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '要不要和对方继续聊天，',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '直接离开信号会结束哦~',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  child: Text(
                                    '继续聊天',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  child: Text('结束信号', style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 26 * w,
                      height: 26 * h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('images/cc.png'), // 左上角的按钮
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 57 * h,
                  left: 170 * w,
                  child: Container(
                    width: 54 * w,
                    height: 24 * h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('images/bb.png'), // 中间的名字
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 45 * h,
                  left: 335 * w,
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 32 * w,
                      height: 32 * h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('images/aa.png'), // 右上角的按钮
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 94 * h,
                  left: 0,
                  child: Container(
                    width: 393 * w,
                    height: 1 * h,
                    color: Colors.grey,
                  ),
                ),
                Positioned(
                  top: 100 * h,
                  child: Container(
                    height: 590 * h,
                    width: 390 * w,
                    color:Colors.white,
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return Align(
                          alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                              children: [
                                if (!message.isMe) CircleAvatar(backgroundImage: AssetImage(message.userAvatar)),
                                SizedBox(width: 8 * w),
                                Container(
                                  height: 40 * h,
                                  child: Text(message.text),
                                  decoration: BoxDecoration(
                                    color: message.isMe ? Color(0xFFE1F7CB): Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                       border: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
  boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
                                  ),

                                  padding: EdgeInsets.all(3),
                                ),
                                SizedBox(width: 8 * w),
                                if (message.isMe) CircleAvatar(backgroundImage: AssetImage(message.userAvatar)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 695 * h,
                  left: 22 * w,
                  child: Container(
                    width: 360 * w,
                    height: 50 * h,
                    child: TextFormField(




                        maxLines: null, // 设置为 null 可以让输入框自动换行228
                          





                      focusNode: _focusNode,
                      controller: _controller,
                      onChanged: (value) {
                        setState(() {
                          _controller.text = value;
                        });
                      },
                      decoration: InputDecoration(




                        contentPadding: EdgeInsets.all(5),//228




                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)), // 设置圆角半径
                        hintText: '主动一点，打个招呼吧~', // 设置提示文本
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Image.asset(
                                'images/dd.png', // 输入框第一个图案
                                width: 24 * w, // 图片宽度
                                height: 24 * h, // 图片高度
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Image.asset(
                                'images/ee.png', // 输入框第二个图案
                                width: 24 * w, // 图片宽度
                                height: 24 * h, // 图片高度
                              ),
                              onPressed: openGallery,
                            ),
                            IconButton(
                              icon: Image.asset(
                                'images/ff.png', // 输入框第三个图案
                                width: 24 * w, // 图片宽度
                                height: 24 * h, // 图片高度
                              ),
                              onPressed: _sendMessage,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
       /* bottomNavigationBar: BottomAppBar(
          height: 60 * h,
          color: Colors.white,
          shape: CircularNotchedRectangle(), // 设置底部导航栏的形状为圆形缺口矩形
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Image.asset(
                  'images/gg.png', // 底边第一个图案
                  width: 20 * w,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                  'images/hh.png', // 底边第二个图案
                  width: 20 * w,
                ),
                onPressed: () {},
              ),
              SizedBox(width: 48 * w), // 创建一个空白的占位符来放置 FloatingActionButton
              IconButton(
                icon: Image.asset(
                  'images/ii.png', // 底边第三个图案
                  width: 20 * w,
                  height: 20 * h,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                  'images/jj.png', // 底边第四个图案
                  width: 20 * w,
                  height: 20 * h,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Opacity(
          opacity: _opacity, // 设置透明度，范围从0.0到1.0
          child: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {},
            shape: CircleBorder(),
            backgroundColor: Colors.blue,
          ),
        ),*/
      ),
    );
  }
}
