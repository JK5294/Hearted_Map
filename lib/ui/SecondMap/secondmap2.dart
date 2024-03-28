import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'AddSecondMap.dart';



class Secondmap2 extends StatefulWidget {
  const Secondmap2({ Key? key }) : super(key: key);

  @override
  _Secondmap2State createState() => _Secondmap2State();
}
    int containerCount = 0; // 记录Container的数量
    List<String> containerTexts = ['sssss',];
class _Secondmap2State extends State<Secondmap2> {
  
  double flexh=1000;
  @override
  Widget build(BuildContext context) {
     TextEditingController _textEditingController4 = TextEditingController();
    final m = MediaQuery.of(context).size;
    final h=m.height/853;
    final w=m.width/393;
    String _postdate='';
    String userId='';//未传到

    Future<void> postData(String postdata,String userId) async {
  var headers = {
    'User-Agent': 'Apifox/1.0.0 (https://apifox.com)',
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse('http://47.122.29.55:9090/heartedmap/map/postpost'));
  request.body = json.encode({
    "userId": 14,
    "type": 1,
    "content": postdata
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {

      String responseBody = await response.stream.bytesToString();
    Map<String, dynamic> postData = json.decode(responseBody);

    _postdate=postData['content'];

    print('ssssssssss');
  } else {
    print(response.reasonPhrase);
  }
}

 void _hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus(); // 隐藏键盘
  }



     
    

    return Scaffold(
      resizeToAvoidBottomInset:true,
      body: GestureDetector(
         onTap: () {
        _hideKeyboard(context); // 点击空白区域时隐藏键盘
      },
        
        child:
       Container(
      width: m.width,
      height: m.height,
      color: Colors.white,
      child: Stack(
        children: [
           Positioned(top: 69*h,left:19*h ,
          child: Container(
            height: 26*h,
            width: 26*w,
            child: TextButton(
      onPressed: () {
           Get.to(() => AddSecondMap());
    
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Container(
  child: SvgPicture.asset(
            'images/back button.svg',
      // 根据需要调整图片填充方式
    ),
  ),
),

),
          ),
          Positioned(
            top: 664*h,
            left: 20*w,
            
            child: Container(
            height: 46*h,
            width: 349*w,
          // color: Colors.amber,
          )),
        
             Positioned(
            top: 743*h,
            left: 160*w,
            
            child: Container(
            height:73.36 *h,
            width: 74.92*w,
            child:TextButton(
      onPressed: () {
       setState(() {
        flexh=400*h;
       // print(flexh);
 
      
       });
       FocusScope.of(context).requestFocus(FocusNode());//忘了这是啥了

      },//
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Add Event.png'),
            // fit: BoxFit.cover, 
          ),
        ),
       // child: TextField(),
      ),
),
          )),
             Positioned(
            top: 765*h,
            left: 249*w,
            
            child: Container(
            height: 36*h,
            width: 102*w,
            child: Image.asset('images/fenxiangwenzi.png'),
          )),
             Positioned(
            top: 700*h,
            left: 40*w,
            
            child: Container(
              //color: Colors.amber,
            height: 120*h,
            width: 100*w,
            child: Image.asset('images/dog2.png'),
          )),
       
               
                
             Positioned(
            top: 100*h,
            left: 0,
            
            child: Container(
            height: 550*h,
            width: m.width,
            child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              
              ListView.builder(
                shrinkWrap: true, // 子ListView根据内容自动调整高度
                itemCount: containerCount, // 根据containerCount确定子ListView的数量
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(containerTexts[index+1]),
                    height: 120*h,
                    width: 349*w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.white,boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),]),
                   
                    margin: EdgeInsets.all(8),
                  );
                },
              ),
            ],
          );
        },
      ),
    ),
          //  color: Colors.amber,
          ),
               Positioned(
            top: flexh,
          left: 0,
            child: Container(
            width: m.width,
            height: 600*h,
      decoration: BoxDecoration(image: DecorationImage(image:AssetImage('images/label.png'),fit: BoxFit.fill)),
            child: Stack(
              children: [
                 Positioned(top: 0,
                left: 0,
                child: Container(height: 200*h,width: m.width,
                margin: EdgeInsets.all(0),
                //olor: Colors.grey,
                  child: TextField(
                       textInputAction: TextInputAction.done,
                    controller: _textEditingController4,
                  decoration: InputDecoration(
                    border: InputBorder.none, // 移除默认的TextField边框
                    
                  ),
                    onSubmitted: (String value) {
                      containerCount++;
                      setState(() {
                       containerTexts.add(value);
                       postData(value, userId);//发送数据给后端
                      });
                      
            // 在键盘确认按钮被按下时触发
            // 这里可以添加处理逻辑，比如提交表单、执行搜索等
            print('Submitted: $value');}
                ),
              
                ),),
                
                 Positioned(top:20 *h,
                left: 356*w,
                child:Container(
                  height: 23*h,
                  width:23 *w,
                 // color: Color.fromARGB(255, 17, 212, 91),
                  child: TextButton(
      onPressed: () {
         setState(() {
           flexh=1000;
         });
    
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Container(
  child: SvgPicture.asset(
            'images/cuohao.svg',
      // 根据需要调整图片填充方式
    ),
  ),
),
                )),
               
              ],
            )
          )),


        ],
      ),

      
     ) ));
  }
}