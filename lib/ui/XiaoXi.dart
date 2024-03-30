import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LiaoTian.dart';



/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     
      home:xiaoxi());
  }
}//import 'package:flutter/material.dart';*/

class xiaoxi extends StatefulWidget {
  const xiaoxi({ Key? key }) : super(key: key);

  @override
  _xiaoxiState createState() => _xiaoxiState();
}

class _xiaoxiState extends State<xiaoxi> {
  @override
 
  Widget build(BuildContext context) {
        final m = MediaQuery.of(context).size;
        final h=m.height/852;
        final w=m.width/393;
    

    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomInset: false,
        body: 
        Container(
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
              image: AssetImage('images/c2.png'),//左上角的按钮
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
                image: AssetImage('images/b2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
                  
                 )),

Positioned(
  top: 30 * h,
  left:300 * w,
  child: TextButton(
    onPressed: () {},
    child: Container(
      width: 64 * w, // 增加宽度
      height: 64 * h, // 增加高度
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage('images/a2.png'), // 图片路径
          fit: BoxFit.contain, // 设置图片的填充方式
        ),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '清空未读消息', // 文本内容
            style: TextStyle(
              color: Colors.blue, // 文本颜色
              fontSize: 24, // 调整文本大小
            ),
          ),
        ),
      ),
    ),
  ),
),





              
                 Positioned(
                top:94*h ,
              left:0 ,
                child: Container(
                  width:393*w ,
                  height: 1*h,
                  color: Colors.grey,
                )),
                


         Positioned(
  top: 100 * h,
  left: 22 * w,
  child: Container(
    width: 393 * h,
    height: 48 * w,
    child: TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)), // 设置圆角半径
        hintText: '搜索聊天记录', // 设置提示文本
        prefixIcon: IconButton(
          icon: Image.asset(
            'images/e2.png', // 输入框第一个图案
            width: 24, // 图片宽度
            height: 24, // 图片高度
          ),
          onPressed: () {
            // 在这里添加按钮点击后的操作
            print("电脑");
          },
        ),
      ),
    ),
  ),
),

Positioned(
  top: 150* h, // 调整top值，让按钮位于输入框下方
  left: 6 * w,
  child:
   Row(
    children: [
      SizedBox(
        width:100, // 设置按钮宽度
        height: 100, // 设置按钮高度
        child: 
        
        IconButton(
          icon: Image.asset(
            'images/aaa.png', // 按钮1图片路径
            width:100, // 图片宽度
            height: 100, // 图片高度
          ),
          onPressed: () {
            // 点击按钮1的操作
          },
        ),
      ),
      
      SizedBox(width: 0), // 添加间距
      SizedBox(
        width: 100, // 设置按钮宽度
        height: 100, // 设置按钮高度
        child: IconButton(
          icon: Image.asset(
            'images/bbb.png', // 按钮2图片路径
            width: 100, // 图片宽度
            height: 100, // 图片高度
          ),
          onPressed: () {
            // 点击按钮2的操作
          },
        ),
      ),
      SizedBox(width: 0), // 添加间距
      SizedBox(
        width: 100, // 设置按钮宽度
        height: 100, // 设置按钮高度
        child: IconButton(
          icon: Image.asset(
            'images/ccc.png', // 按钮3图片路径
            width: 100, // 图片宽度
            height: 100, // 图片高度
          ),
          onPressed: () {
            // 点击按钮3的操作
          },
        ),
      ),

      SizedBox(width: 0), // 添加间距
      SizedBox(
        width: 100, // 设置按钮宽度
        height: 100, // 设置按钮高度
        child: IconButton(
          icon: Image.asset(
            'images/ddd.png', // 按钮4图片路径
            width: 100, // 图片宽度
            height: 100, // 图片高度
          ),
          onPressed: () {
            // 点击按钮4的操作
          },
        ),
      ),
    ],
  ),
),



Positioned(
  top: 260 * h,
  left: 6 * w,
  child: Column(
    children: [
      SizedBox(
        width: 100*w,
        height: 100*h,
        child: IconButton(
          icon: Image.asset(
            'images/aaa.png',
           

            width: 100*w,
            height: 100,
          ),
         
          onPressed: () {
            // 点击按钮1的操作
          },
        ),
      ),
      
      

      Divider(height: 1, color: Colors.black), // 使用Divider代替手动绘制的水平线

      SizedBox(
        width: 100*w,
        height: 100,
        child: IconButton(
          icon: Image.asset(
            'images/bbb.png',
            width: 100,
            height: 100,
          ),
          onPressed: () {
            // 点击按钮2的操作
          },
        ),
      ),
      
      Divider(height: 1, color: Colors.black),

      SizedBox(
        width: 100*w,
        height: 100,
        child: IconButton(
          icon: Image.asset(
            'images/ccc.png',
            width: 100,
            height: 100,
          ),
          onPressed: () {
            // 点击按钮3的操作
          },
        ),
      ),
      
      Divider(height: 1, color: Colors.black),

      SizedBox(
        width: 100*w,
        height: 100,
        child: IconButton(
          icon: Image.asset(
            'images/ddd.png',
            width: 100,
            height: 100,
          ),
          onPressed: () {
            // 点击按钮4的操作
          },
        ),
      ),
    ],
  ),
),

  Positioned(
                 top:230*h,
               left:36 *w,
                 child: Container(
                  width:30*w,
                  height:15 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/l2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),

        Positioned(
                 top:230*h,
               left:120 *w,
                 child: Container(
                  width:30*w,
                  height:15 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/m2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),

        Positioned(
                 top:230*h,
               left:208*w,
                 child: Container(
                  width:30*w,
                  height:15 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/n2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),

        Positioned(
                 top:230*h,
               left:293*w,
                 child: Container(
                  width:30*w,
                  height:15 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/o2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),

        Positioned(
                 top:286*h,
               left:116*w,
                 child: Container(
                  width:46*w,
                  height:22 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/p2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),

Positioned(
                 top:386*h,
               left:116*w,
                 child: Container(
                  width:46*w,
                  height:22 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/q2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),

Positioned(
                 top:486*h,
               left:116*w,
                 child: Container(
                  width:46*w,
                  height:22 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/r2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),

Positioned(
                 top:576*h,
               left:116*w,
                 child: Container(
                  width:46*w,
                  height:22 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/o2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),



  Positioned(
                 top: 250*h,
               left:8 *w,
                 child: Container(
                  width:393*w,
                  height:1 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/k2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),
        Positioned(top: 256*h,left:6*w,
        child: GestureDetector(onTap: () {
          Get.to(Liaotian());
          print('wew');},
          child:Container(height: 100*h,width: 700*w,color: Colors.transparent)
        

        )),

 Positioned(
                 top: 364*h,
               left:8 *w,
                 child: Container(
                  width:393*w,
                  height:1 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/k2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),
// Positioned(top: 364*h,child: button()),
 Positioned(
                 top: 460*h,
               left:8 *w,
                 child: Container(
                  width:393*w,
                  height:1 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/k2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),
 //Positioned(top: 460*h,child: button()),
Positioned(
                 top: 556*h,
               left:8 *w,
                 child: Container(
                  width:393*w,
                  height:1 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/aaa.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),
 //Positioned(top: 556*h,child: ,),
        Positioned(
                 top: 660*h,
               left:8 *w,
                 child: Container(
                  width:393*w,
                  height:1 *h,
                  decoration: BoxDecoration(
                 color: Colors.white,
                image: DecorationImage(
                image: AssetImage('images/k2.png'),//中间的名字
                fit: BoxFit.fill,
        ),
      ),
        )
        ),



        ]
        ),

        ),
        

  
        
          bottomNavigationBar: BottomAppBar(
  shape: CircularNotchedRectangle(), // 设置底部导航栏的形状为圆形缺口矩形
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      IconButton(
        icon: Image.asset(
                'images/g2.png', // 底边第一个图案
                width: 20*w, 
              ),
        onPressed: () {},
      ),

      IconButton(
         icon: Image.asset(
                'images/h2.png', // 底边第二个图案
                width: 20, 
              ),
        onPressed: () {},
      ),
      SizedBox(width: 48),// 创建一个空白的占位符来放置 FloatingActionButton

      IconButton(
         icon: Image.asset(
                'images/i2.png', // 底边第三个图案
                width: 20, 
                height: 20, 
              ),
        onPressed: () {},
      ),
      
      IconButton(
         icon: Image.asset(
                'images/j2.png', // 底边第四个图案
                width: 20, 
                height: 20, 
              ),
        onPressed: () {},
      ),

    ],
  ),
),

floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
  onPressed: () {},
),

        
      ),

    );
  }
}


