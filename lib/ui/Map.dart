import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home :Map());
  }
}//import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  const Map({ Key? key }) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override

  Widget build(BuildContext context) {
        final m = MediaQuery.of(context).size;
        final h=m.height/852;
        final w=m.width/393;

    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomInset: false,
        body: Container(
          width: m.width,
          height: m.height,
          child: Stack(
            children: [

            Positioned(
            top: 45*h,
            left: 8*w,
            child: TextButton(
              onPressed: () {},
              child: Container(
               width: 26 * w,
              height: 26 * h,
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
              image: AssetImage('images/cc.png'),//左上角的按钮
              fit: BoxFit.fill,
        ),
      ),
      
    ),
  ),
),
      
    
    


                 Positioned(
                 top: 50*h,
               left:170 *w,
                 child: Container(
                  width:54 *w,
                  height:24 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/mymap.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
                  
                 )),
                

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
               image: AssetImage('images/test2.png'),//右上角的按钮
               fit: BoxFit.fill,
        ),
      ),
    ),
  ),
),


               Stack(
  children: [
    Positioned.fill(
      top: 100 * h,
      left: 3 * w,
      child: TextButton(
        onPressed: () {
          // 按钮点击时执行的操作
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/K.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  ],
),

Stack(
  children: [
    Positioned.fill(
      top: MediaQuery.of(context).size.height - 46 * h,
      left: 10 * w,
      child: TextButton(
        onPressed: () {
          // 按钮点击时执行的操作
        },
        child: Container(
          width: 358 * w,
    height: 46 * h,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/L.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  ],
),


Stack(
  children: [
    Positioned(
      top: 300*h,
               left:10 *w,
      child: TextButton(
        onPressed: () {
          // 按钮点击时执行的操作
        },
        child: Container(
          width:103 *w,
                  height:112 *h,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/M.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  ],
),

Stack(
  children: [
    Positioned(
       top:420*h,
               left:260 *w,
      child: TextButton(
        onPressed: () {
          // 按钮点击时执行的操作
        },
        child: Container(
          width:80 *w,
                  height:80 *h,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/O.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  ],
),

Stack(
  children: [
    Positioned(
       top: 200*h,
               left:250 *w,
      child: TextButton(
        onPressed: () {
          // 按钮点击时执行的操作
        },
        child: Container(
          width:80 *w,
                  height:80*h,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/Q.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  ],
),

      Stack(
  children: [
    Positioned(
       top: 500*h,
               left:50 *w,
      child: TextButton(
        onPressed: () {
          // 按钮点击时执行的操作
        },
        child: Container(
          width:80 *w,
                  height:80 *h,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/R.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  ],
),  

Stack(
  children: [
    Positioned(
       top: 120*h,
               left:50 *w,
      child: TextButton(
        onPressed: () {
          // 按钮点击时执行的操作
        },
        child: Container(
          width:60 *w,
                  height:60 *h,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/S.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  ],
),

                 Positioned(
                top:94*h ,
              left:0 ,
                child: Container(
                  width:393*w ,
                  height: 1*h,
                  color: Colors.grey,
                
                



          
                ))]))));}
}