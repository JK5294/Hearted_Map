import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Sex extends StatefulWidget {
  const Sex({ Key? key }) : super(key: key);

  @override
  _SexState createState() => _SexState();
}

class _SexState extends State<Sex> {
  @override
  Widget build(BuildContext context) {
      final m = MediaQuery.of(context).size;
    final h=m.height/852;
    final w= m.width/393;
    return Container(
      height: m.height,
      width: m.width,
      color: Colors.blue[100],
      child: Stack(
        children: [
          Positioned(
            top:179*h,
            left: 43*w,


            
            child: 
            Container(
              height: 45*h,
              width: 259*w,
              child: SvgPicture.asset('images/Hi.svg'),


            )),
              Positioned(
            top:228*h,
            left: 43*w,


            
            child: Container(
              height: 19*h,
              width: 266*w,
              child:   Text('欢迎来到心动地图，有趣的朋友在等你发现',style: TextStyle(fontSize: 10,color: Colors.grey,letterSpacing: 2.0,decoration: TextDecoration.none),),


            )),
              Positioned(
            top:341*h,
            left: 140*w,


            
            child: GestureDetector(
              onTap: () {
                print('jjjj');
              },
              child:
            Container(
                   decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(100)),
              height: 112*h,
              width: 112*w,
              child: SvgPicture.asset('images/boy.svg',fit: BoxFit.cover,),


            )),),
             Positioned(
            top:527*h,
            left: 140*w,


            
            child: GestureDetector(  
              onTap: () {
                print('sss');

              },                         
              child:
            Container(
              height: 112*h,
              width: 112*w,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(100)),
              child: SvgPicture.asset('images/girl.svg'),


            ))),
             Positioned(
              top:747*h ,
              left: 115*w,
              
              child: Container(
            height: 47*h,
            width: 150*w,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(36),
              
            ),
            child: TextButton(onPressed: (){}, child: Text('下一步',style: TextStyle(fontSize: 20,color: Colors.white),)),
            
              )
            )
          
        ],
      ),

      
    );
  }
}