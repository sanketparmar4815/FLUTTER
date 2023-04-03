import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// void main() {
//   runApp(MaterialApp(
//     home: tic_tac_toc(""),
//     debugShowCheckedModeBanner: false,
//   ));
// }

class tic_tac_toc extends StatefulWidget {
  String mode="";
   tic_tac_toc(this.mode, {Key? key}) : super(key: key);

  @override
  State<tic_tac_toc> createState() => _tic_tac_tocState();
}

class _tic_tac_tocState extends State<tic_tac_toc> {
  int count = 0;
  int i = 0;
  List a = [];
  int rcount=0;
  bool flag = false;
  bool celibration = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a = List.filled(9, "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
            "Tic Tac Toe",
            style: TextStyle(
                color: Color(0xffC0DEFF), fontWeight: FontWeight.bold),
          )),
          backgroundColor: Color(0xff227C70)),
      body: flag
          ? Container(
        child: Center(
            child: Stack(
              children: [
                celibration
                    ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Lottie.asset(
                      "animation/131561-fb-celebration.json"),
                )
                    : Container(),
                Center(
                  child: Container(
                    height: 260,
                    width: 290,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(" CONGRATULATIONS! \n           ${t}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.home,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                height: 60,
                                width: 60,
                                margin: EdgeInsets.only(top: 20, left: 60),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.black),
                              ),
                              Container(
                                child: Icon(
                                  Icons.restart_alt_sharp,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                margin: EdgeInsets.only(top: 20, left: 42),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 30),
                            height: 60,
                            width: 200,
                            child: Center(
                                child: Text("CONTINUE",
                                    style: TextStyle(color: Colors.white))),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.pink))
                      ],
                    ),
                  ),
                )
              ],
            )),
      )
      // Container(
      //         width: double.infinity,
      //         color: Color(0xff181D31),
      //         child: Center(
      //           child: Stack(
      //             children: [
      //               celibration
      //                   ? Container(
      //                       height: double.infinity,
      //                       width: double.infinity,
      //                       child: Lottie.asset(
      //                           "animation/131561-fb-celebration.json"),
      //                     )
      //                   : Container(),
      //               Center(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     Container(
      //                       child: Center(
      //                         child: Text(t,
      //                             style: TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 25,
      //                                 color: Color(0xff181D31))),
      //                       ),
      //                       width: 300,
      //                       height: 100,
      //                       decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(25),
      //                           color: Color(0xffC0DEFF)),
      //                     ),
      //                     InkWell(
      //                       onTap: () {
      //                         setState(() {
      //                           print("yes tap on reset");
      //                           flag = false;
      //                           // a.clear();
      //                           a = List.filled(9, "");
      //                           rcount=0;
      //                         });
      //                       },
      //                       child: Container(
      //                           height: 100,
      //                           width: 300,
      //                           child: Center(
      //                             child: Text("RESET",
      //                                 style: TextStyle(
      //                                     fontWeight: FontWeight.bold,
      //                                     fontSize: 25,
      //                                     color: Color(0xff181D31))),
      //                           ),
      //                           decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(25),
      //                               color: Color(0xffC0DEFF))),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ))
          : Container(
              color: Color(0xff2B3467),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          print("tap on first");
                          setList(0);
                          win();
                        },
                        child: Container(
                            child: Center(
                                child: Text(a[0],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40))),
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xffC0DEFF))),
                      ),
                      InkWell(
                        onTap: () {
                          print("ön tap 11");
                          setList(1);
                          win();
                        },
                        child: Container(
                            child: Center(
                                child: Text(a[1],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40))),
                            // child: Center(child: Text("${a[1]}")),
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xffC0DEFF))),
                      ),
                      InkWell(
                        onTap: () {
                          setList(2);
                          win();
                        },
                        child: Container(
                            child: Center(
                                child: Text(a[2],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40))),
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xffC0DEFF))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setList(3);
                          win();
                        },
                        child: Container(
                            child: Center(
                                child: Text(a[3],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40))),
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xffC0DEFF))),
                      ),
                      InkWell(
                        onTap: () {
                          setList(4);
                          win();
                        },
                        child: Container(
                            child: Center(
                                child: Text(a[4],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40))),
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xffC0DEFF))),
                      ),
                      InkWell(
                        onTap: () {
                          setList(5);
                          win();
                        },
                        child: Container(
                            child: Center(
                                child: Text(a[5],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40))),
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xffC0DEFF))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setList(6);
                          win();
                        },
                        child: Container(
                            child: Center(
                                child: Text(a[6],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40))),
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xffC0DEFF))),
                      ),
                      InkWell(
                        onTap: () {
                          setList(7);
                          win();
                        },
                        child: Container(
                            child: Center(
                                child: Text(a[7],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40))),
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xffC0DEFF))),
                      ),
                      InkWell(
                        onTap: () {
                          setList(8);
                          win();
                        },
                        child: Container(
                            child: Center(
                                child: Text(a[8],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40))),
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xffC0DEFF))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  void setList(int i) {
    setState(() {
      // if (count % 2 == 0) {
      //   if (a[i] == "") {
      //     a[i] = "x";
      //     count++;
      //   }
      // } else {
      //   if (a[i] == "") {
      //     a[i] = "0";
      //     count++;
      //   }
      // }

      if(a[i]=="") {
        a[i] = "x";
        count++;
        if (rcount!=4){
          while (true) {
            int r = Random().nextInt(9);
            if (a[r] == "") {
              print("===$r");
              a[r] = "0";
              win();
              rcount++;
              count++;
              break;
            }
          }
      }
      }
    });
  }



  String t = "";

  void win() {
    setState(() {
      if ((a[0] == "x" && a[1] == "x" && a[2] == "x") ||
          (a[0] == "x" && a[4] == "x" && a[8] == "x") ||
          (a[0] == "x" && a[3] == "x" && a[6] == "x") ||
          (a[3] == "x" && a[4] == "x" && a[5] == "x") ||
          (a[6] == "x" && a[7] == "x" && a[8] == "x") ||
          (a[1] == "x" && a[4] == "x" && a[7] == "x") ||
          (a[2] == "x" && a[5] == "x" && a[8] == "x") ||
          (a[2] == "x" && a[4] == "x" && a[6] == "x")) {
        count = 0;
        flag = true;
        celibration = true;
        t = "X IS WIN!";
      }
      else if ((a[0] == "0" && a[1] == "0" && a[2] == "0") ||
          (a[0] == "0" && a[4] == "0" && a[8] == "0") ||
          (a[0] == "0" && a[3] == "0" && a[6] == "0") ||
          (a[3] == "0" && a[4] == "0" && a[5] == "0") ||
          (a[6] == "0" && a[7] == "0" && a[8] == "0") ||
          (a[1] == "0" && a[4] == "0" && a[7] == "0") ||
          (a[2] == "0" && a[5] == "0" && a[8] == "0") ||
          (a[2] == "0" && a[4] == "0" && a[6] == "0")) {
        count = 0;
        flag = true;
        celibration = true;
        t = "0 IS WIN !";
      }
      else if (count == 9) {
        count = 0;
        flag = true;
        celibration = false;

        t = "THAT'S A DRAW!";
      }
    });
  }
}
