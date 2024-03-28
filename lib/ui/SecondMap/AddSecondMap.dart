import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hearted_map/ui/MakeMapPage/YourMapPage.dart';
import 'package:hearted_map/ui/SecondMap/secondmap2.dart';

class AddSecondMap extends StatefulWidget {
  const AddSecondMap({super.key});

  @override
  State<AddSecondMap> createState() => _AddSecondMapState();
}

class _AddSecondMapState extends State<AddSecondMap> {
  @override
  Widget build(BuildContext context) {
    final m = MediaQuery.of(context).size;
    final h=m.height/853;
    final w=m.width/393;

    return Container(
      color: Colors.white,
      height: m.height,
      width: m.width,
      child:  Stack(
        children: [
          Positioned(
            left: 20*w,
            top: 79*h,
            child: Container(
            width: 180*w,
            height: 180*h,//
          // color: Colors.amber,
         child: SvgPicture.asset('images/dog.svg'),
          )),
          Positioned(top: 69*h,left:19*h ,
          child: Container(
            height: 26*h,
            width: 26*w,
            child: TextButton(
      onPressed: () { Get.to(MakeMapPage());},
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
            left: 180*w,
            top: 132*h,
            child: Container(
            width: 192*w,
            height: 46*h,
           // color: Colors.amber,
         child: SvgPicture.asset('images/huanying.svg'),
          )),
           Positioned(
            left: 16*w,
            top: 341*h,
            child: Container(
            width: 223*w,
            height: 46*h,
           // color: Colors.amber,
         child: SvgPicture.asset('images/sui.svg'),
          )),
          Positioned(
            left: 22*w,
            top: 404*h,
            child: Container(
            width: 369*w,
            height: 192*h,
           // color: Colors.amber,
         child: SvgPicture.asset('images/jing.svg'),
          )),
          Positioned(
            left: 0*w,
            top: 645*h,
            child: Container(
            width: 371*w,
            height: 44*h,
           // color: Colors.amber,
         child: SvgPicture.asset('images/wo.svg'),
          )),
          Positioned(
            left: 35*w,
            top: 256*h,
            child: Container(
            width: 170*w,
            height: 29*h,
           // color: Colors.amber,
         child: SvgPicture.asset('images/more about me.svg'),
          )),
           Positioned(
            left: 135*w,
            top: 737*h,
            child: Container(
            width: 124*w,
            height: 56*h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(37),image: DecorationImage(image: AssetImage('images/tansuo.png'))),
  child: TextButton(
      onPressed: () {
       Get.to(Secondmap2());

      },//
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/tansuo.png'),
            // fit: BoxFit.cover, 
          ),
        ),
      ),
),
          
            ))
         
          
        ],
      )
      
    );
  }
}
