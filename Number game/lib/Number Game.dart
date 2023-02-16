import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MaterialApp(
    home: number_game(),
    debugShowCheckedModeBanner: false,
  ));
}
class number_game extends StatefulWidget {
  const number_game({Key? key}) : super(key: key);

  @override
  State<number_game> createState() => _number_gameState();
}

class _number_gameState extends State<number_game> {
  // List a = ["5", "7", "3", "", "4", "1", "6", "8", "2"];
  bool fix = false;
  List a = [];

  // List l=[];

  void initState() {
    super.initState();
    reset();
  }

  reset() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        while (true) {
          int rr = Random().nextInt(9);

          if (!a.contains("$rr")) {
            a.add("$rr");
            break;
          }
        }
      }
      for (int i = 0; i < 9; i++) {
        if (a[i] == "0") {
          a[i] = "";
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffC58940),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        print("on tap 1");
                        setState(() {
                          if (fix == false) {
                            if (a[0] != "") {
                              if (a[3] == "") {
                                a[3] = a[0];
                                a[0] = "";
                              } else if (a[1] == "") {
                                a[1] = a[0];
                                a[0] = "";
                              }
                            }
                            win();
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                              a[0],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            )),
                        decoration: BoxDecoration(
                            color: Color(0xffFAEAB1),
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 3)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (fix == false) {
                            if (a[1] != "") {
                              if (a[0] == "") {
                                a[0] = a[1];
                                a[1] = "";
                              } else if (a[4] == "") {
                                a[4] = a[1];
                                a[1] = "";
                              } else if (a[2] == "") {
                                a[2] = a[1];
                                a[1] = "";
                              }
                            }
                            win();
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                              a[1],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                        decoration: BoxDecoration(
                            color: Color(0xffFAEAB1),
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 3)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (fix == false) {
                            if (a[2] != "") {
                              if (a[1] == "") {
                                a[1] = a[2];
                                a[2] = "";
                              } else if (a[5] == "") {
                                a[5] = a[2];
                                a[2] = "";
                              }
                            }
                            win();
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                            child: Text(a[2],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25))),
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                            color: Color(0xffFAEAB1),
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 3)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (fix == false) {
                            if (a[3] != "") {
                              if (a[0] == "") {
                                a[0] = a[3];
                                a[3] = "";
                              } else if (a[4] == "") {
                                a[4] = a[3];
                                a[3] = "";
                              } else if (a[6] == "") {
                                a[6] = a[3];
                                a[3] = "";
                              }
                            }
                            win();
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                            child: Text(a[3],
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))),
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                            color: Color(0xffFAEAB1),
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 3)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (fix == false) {
                            if (a[4] != "") {
                              if (a[1] == "") {
                                a[1] = a[4];
                                a[4] = "";
                              } else if (a[3] == "") {
                                a[3] = a[4];
                                a[4] = "";
                              } else if (a[5] == "") {
                                a[5] = a[4];
                                a[4] = "";
                              } else if (a[7] == "") {
                                a[7] = a[4];
                                a[4] = "";
                              }
                            }
                            win();
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                              a[4],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                            color: Color(0xffFAEAB1),
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 3)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (fix == false) {
                            if (a[5] != "") {
                              if (a[2] == "") {
                                a[2] = a[5];
                                a[5] = "";
                              } else if (a[4] == "") {
                                a[4] = a[5];
                                a[5] = "";
                              } else if (a[8] == "") {
                                a[8] = a[5];
                                a[5] = "";
                              }
                            }
                            win();
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                              a[5],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                            color: Color(0xffFAEAB1),
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 3)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (fix == false) {
                            if (a[6] != "") {
                              if (a[3] == "") {
                                a[3] = a[6];
                                a[6] = "";
                              } else if (a[7] == "") {
                                a[7] = a[6];
                                a[6] = "";
                              }
                            }
                            win();
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                              a[6],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                            color: Color(0xffFAEAB1),
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 3)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (fix == false) {
                            if (a[7] != "") {
                              if (a[4] == "") {
                                a[4] = a[7];
                                a[7] = "";
                              } else if (a[6] == "") {
                                a[6] = a[7];
                                a[7] = "";
                              } else if (a[8] == "") {
                                a[8] = a[7];
                                a[7] = "";
                              }
                            }
                            win();
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                              a[7],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                            color: Color(0xffFAEAB1),
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 3)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (fix == false) {
                            if (a[8] != 0) {
                              if (a[5] == "") {
                                a[5] = a[8];
                                a[8] = "";
                              } else if (a[7] == "") {
                                a[7] = a[8];
                                a[8] = "";
                              }
                            }
                            win();
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                              a[8],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                            color: Color(0xffFAEAB1),
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 3)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Center(
                          child: Text(
                            l,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffFAEAB1),
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 3)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffFAEAB1),
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 3)),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            a.clear();
                            reset();
                            l = " ";
                            fix = false;
                          });
                        },
                        child: Center(
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  win() {
    setState(() {
      if (a[0] == "1" &&
          a[1] == "2" &&
          a[2] == "3" &&
          a[3] == "4" &&
          a[4] == "5" &&
          a[5] == "6" &&
          a[6] == "7" &&
          a[7] == "8" &&
          a[8] == "") {
        l = "win";
        fix = true;
      }
    });
  }

  String l = "";
}
