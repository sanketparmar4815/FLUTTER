import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpuzzles/main.dart';
import 'package:mathpuzzles/second_page.dart';



class first_page extends StatefulWidget {

int level;

first_page(this.level);

@override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
  String Font = "chalk";
  String display = "";


  @override
  Widget build(BuildContext context) {
    double navi1 = MediaQuery.of(context).padding.top;
    return WillPopScope(onWillPop: () {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Alert"),
            content: Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(context);

                },
                child: Text("NO"),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                     // exit(0);
                    });
                    // Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Main_page();
                    },));
                  },
                  child: Text("YES")),
            ],
          ));
      return Future.value(true);
    }
    ,child:Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/gameplaybackground.jpg"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, navi1, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(onTap: () {

                    setState(() {
                      Main_page.sw[widget.level]="skip";
                      Main_page.prefs!.setString("status${widget.level}","skip");
                      setState(() {
                        widget.level++;
                        Main_page.prefs!.setInt("level", widget.level);
                      });

                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return first_page(widget.level);
                      // },));
                    });
                  },

                    child: Container(

                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "image/skip.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("image/level_board.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Center(
                        child: Text("Puzzle ${widget.level+1}",
                            style: TextStyle(
                                fontFamily: Font,
                                fontWeight: FontWeight.bold,
                                fontSize: 24))),
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "image/hint.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 240),
              height: 619,
              width: 392,
              child: Image.asset(
                "image/p${widget.level +1}.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(

              color: Colors.black,
              height: 120,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Text("$display",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24))),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              display =
                                  display.substring(0, display.length - 1);
                            });
                          },
                          icon: Icon(
                            Icons.backspace_rounded,
                            color: Colors.white,
                          )),
                      InkWell(
                          onTap: () {
                            setState(() {
                              // if (display == "123")
                              if (display == anslist[widget.level])
                              {
                                setState(() {
                                  Main_page.sw[widget.level]="Success";
                                  Main_page.prefs!.setString("status${widget.level}","Success");
                                  setState(() {
                                    widget.level++;
                                    Main_page.prefs!.setInt("level", widget.level);
                                  });


                                });

                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return Second_page(widget.level);
                                },));

                              }
                              else {
                                Fluttertoast.showToast(
                                    msg: 'wrong!!',
                                    fontSize: 20,
                                    toastLength: Toast.LENGTH_LONG,
                                    timeInSecForIosWeb: 1,
                                    gravity: ToastGravity.CENTER);
                              }
                            });
                          },
                          child: Text("Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            getvalue("1");
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 30,
                          child: Center(
                              child: Text("1",
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            getvalue("2");
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 30,
                          child: Center(
                              child: Text("2",
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            getvalue("3");
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 30,
                          child: Center(
                              child: Text("3",
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            getvalue("4");
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 30,
                          child: Center(
                              child: Text("4",
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            getvalue("5");
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 30,
                          child: Center(
                              child: Text("5",
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            getvalue("6");
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 30,
                          child: Center(
                              child: Text("6",
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            getvalue("7");
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 30,
                          child: Center(
                              child: Text("7",
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            getvalue("8");
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 30,
                          child: Center(
                              child: Text("8",
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            getvalue("9");
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 30,
                          child: Center(
                              child: Text("9",
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            getvalue("0");
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 30,
                          child: Center(
                              child: Text("0",
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),);


  }

  void getvalue(String s) {
    display = display + s;
  }
  List anslist = [
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    // "10",
    // "25",
    // "6",
    // "14",
    // "128",
    // "7",
    // "50",
    // "1025",
    // "100",
    // "3", //10
    // "212",
    // "3011",
    // "14",
    // "16",
    // "1",
    // "2",
    // "44",
    // "45",
    // "625",
    // "1",//20
    // "13",
    // "47",
    // "50",
    // "34",
    // "6",//25
    // "41",
    // "16",
    // "126",
    // "82",
    // "14",//30
    // "7",
    // "132",
    // "34",
    // "48",
    // "42",
    // "288",
    // "45",
    // "4",
    // "111",
    // "47",
    // "27",
    // "87",
    // "22",
    // "253",
    // "12",
    // "38",
    // "178",
    // "1",
    // "6",
    // "10",
    // "2",
    // "20",
    // "7",
    // "511",
    // "143547",
    // "84",
    // "11",
    // "27",
    // "3",
    // "5",
    // "39",
    // "31",
    // "10",
    // "130",
    // "22",
    // "3",
    // "14",
    // "42",
    // "164045",
    // "11",
    // "481",
    // "86",
    // "84",
    // "13",
    // "8"
  ];
}
