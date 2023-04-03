import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: Demo(), debugShowCheckedModeBanner: false,));
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth  = MediaQuery.of(context).size.width;
    double navi =MediaQuery.of(context).padding.top;
    double status=MediaQuery.of(context).padding.bottom;
    double height1 = theight  - navi;
    print("--------${height1}------------ ${twidth}");
    final l = MediaQuery.of(context).size.height >= MediaQuery.of(context).size.width? MediaQuery.of(context).size.width :MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          // height: height1 * .03,
          // width: twidth * .03,
          padding: EdgeInsets.all(15),
          width:l,
          height: l,
          color: Colors.black,
        ),
      ),
    );
  }
}
