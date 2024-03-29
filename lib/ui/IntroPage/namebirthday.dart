import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'sex.dart';

class Namebirthday extends StatefulWidget {
  
   final String password;
  final String account;


  const Namebirthday({Key? key, required this.password, required this.account}) : super(key: key);
  

  @override
  _NamebirthdayState createState() => _NamebirthdayState();
}

class _NamebirthdayState extends State<Namebirthday> {
  @override
  final TextEditingController _textEditingController2 = TextEditingController();
  Widget build(BuildContext context) {
   int UserId=1;
     Future<String> sendDataToBackend(String phone, String pass,String name) async {
  var headers = {
   'User-Agent': 'Apifox/1.0.0 (https://apifox.com)',
   'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('http://47.122.29.55:9003/heartedmap/auth/register'));
request.body = json.encode({
   "name":name,
   "email": phone,
   "password": pass
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();
 String responseBody = await response.stream.bytesToString();
    Map<String, dynamic> responseData = json.decode(responseBody);

if (response.statusCode == 200) {
   print('正常');
   print(responseData['msg']);
  print(responseData['id']);
   UserId=responseData['data']['id'];
   print(UserId);
}
else {
   print(responseBody);
}
  return '';
}
  /*   final Map<String, dynamic> args = Get.arguments;
    final String password= args['password'];
    final String account = args['account'];*/
     final m = MediaQuery.of(context).size;
    final h=m.height/852;
    final w= m.width/393;
     
     String name=' ';
    return GetMaterialApp(
      home:
    
    Scaffold(
      body: Container(
        color: Colors.amber[100],
        child: Stack(
          children: [
            Positioned(
              top: 210*h,
              left: 45*w,
              child: Container(
              child: Center(child: Text('输入一个昵称吧',style: TextStyle(fontSize: 20),),),
              width: 182*w,
              height: 27*h,

              )
            ),  Positioned(
              top: 253*h,
              left: 38*w,
              child: Container(
               
            child: TextField( 
              controller: _textEditingController2,
           onSubmitted: (String value) {
    setState(() {
      // 更新TextField的值
      _textEditingController2.text = value;
    });
  },
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.0), 
    border: InputBorder.none,  // 去除边框
              
            ),),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(27)),

              width: 318*w,
              height: 59*h,

            )
            ),
              Positioned(
              top: 358*h,
              left: 48*w,
              child: Container(
              child: Text('你的生日是？',style: TextStyle(fontSize: 20),),
              
              width: 156*w,
              height: 27*h,

            )
            ),
              Positioned(
              top: 397*h,
              left: 38*w,
              
              child: Container(
               
            child:    TextField( 
       
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                   
               //contentPadding: EdgeInsets.symmetric(horizontal: 10.0), 
   border: InputBorder.none,  // 去除边框
     suffixIcon: IconButton(
      onPressed: () {},
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('请输入', style: TextStyle(fontSize: 16,color: Colors.grey)),
          Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    ),
             ),),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(27)),

              width: 318*w,
              height: 59*h,

            ),
              

            
            ),
              Positioned(
              top: 500*h,
              left:0 *w,
              child: Container(
                child: SvgPicture.asset('images/zuoren.svg',fit: BoxFit.fill,),
              //color: Color.fromARGB(255, 28, 145, 141),
              width: 200*w,
              height:350 *h,

            )
            ),
            Positioned(
              top:578*h,
              left: 172*w,
              
              child: Container(
            height: 47*h,
            width: 150*w,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(36),
              
            ),
            child: TextButton(onPressed: (){
              name=_textEditingController2.text;
              sendDataToBackend(widget.account, widget.password, name);
              
              Get.to(
                Sex());}, child: Text('下一步',style: TextStyle(fontSize: 20,color: Colors.white),)),
            
              )
            )
          

          ],
        ),

      ),
     ) );
  }
}