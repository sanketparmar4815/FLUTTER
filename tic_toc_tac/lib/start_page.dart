import 'package:flutter/material.dart';
import 'package:tic_toc_tac/main.dart';

void main() {
  runApp(MaterialApp(
    home: Start_page(),
    debugShowCheckedModeBanner: false,
  ));
}

class Start_page extends StatefulWidget {
  const Start_page({Key? key}) : super(key: key);

  @override
  State<Start_page> createState() => _Start_pageState();
}

class _Start_pageState extends State<Start_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        color: Color(0xff181D31),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return tic_tac_toc("auto");
                    },
                  ));
                });
              },
              child: Container(
                height: 110,
                width: 400,

                margin:
                    EdgeInsets.only(top: 600, left: 50, right: 50, bottom: 50),
                alignment: Alignment.bottomCenter,
                child: Center(
                    child: Text("START",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color(0xff181D31),
                        ))),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffC0DEFF),
                ),

                // color: Color(0xffC0DEFF) ,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 200,
                  ),
                  height: 200,
                  width: 170,
                  child: Center(
                      child: Text(
                    "X",
                    style: TextStyle(
                        fontSize: 200,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffC0DEFF)),
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 200),
                  height: 200,
                  width: 170,
                  child: Center(
                      child: Text(
                    "0",
                    style: TextStyle(
                        fontSize: 200,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffC0DEFF)),
                  )),
                ),
              ],
            )
          ],
        ),
        // child: Text("Start game ",style:TextStyle(color: Colors.black),),
      ),
    );
  }
}
