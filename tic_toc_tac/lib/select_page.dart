import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: select_page(),
    debugShowCheckedModeBanner: false,
  ));
}

class select_page extends StatefulWidget {
  const select_page({Key? key}) : super(key: key);

  @override
  State<select_page> createState() => _select_pageState();
}

class _select_pageState extends State<select_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff181D31),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 80),
                child: Text(" CHOOSE A SIDE ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xffC0DEFF))),
              ),
            ),
            Expanded(
                flex: 3,
                child: InkWell(onTap: () {
                  setState(() {
                    print("Tap on X");
                  });
                },
                  child: Container(
                      child:Center(
                          child: Text(
                            "X",
                            style: TextStyle(
                                fontSize: 200,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffC0DEFF)),
                          ))),
                )),
            Expanded(
                flex: 3,
                child: InkWell(onTap: () {
                  setState(() {
                    print("Tap on 0");
                  });
                },
                  child: Container(
                      child:Center(
                          child: Text(
                            "0",
                            style: TextStyle(
                                fontSize: 200,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffC0DEFF)),
                          ))),
                ))
          ],
        ),
      ),
    );
  }
}
