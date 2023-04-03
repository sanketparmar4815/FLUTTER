import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mathpuzzles/first_page.dart';
import 'package:mathpuzzles/select_puzzle.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: Main_page(),
    debugShowCheckedModeBanner: false,
  ));
}

class Main_page extends StatefulWidget {
  static SharedPreferences? prefs;
  static List sw = [];

  const Main_page({Key? key}) : super(key: key);

  @override
  State<Main_page> createState() => _Main_pageState();
}

class _Main_pageState extends State<Main_page> {
  // static SharedPreferences? prefs;
  int level = 0;

  @override
  void initState() {
    // TODO: implement initState
    getlevel();
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double navi = MediaQuery.of(context).padding.top;
    double status = MediaQuery.of(context).padding.bottom;
    double height1 = theight - navi;
    // final l = MediaQuery.of(context).size.height >= MediaQuery.of(context).size.width? MediaQuery.of(context).size.width :MediaQuery.of(context).size.height;
    final l = MediaQuery.of(context).size.width;
    print("--------${height1}------------ ${twidth}");

    String Font = "chalk";

    return WillPopScope(
      onWillPop: () {
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
                            exit(0);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("YES")),
                  ],
                ));
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("image/background.jpg"),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      l * 0.03819, l * .02546, l * 0.03819, 0),
                  //l*0.03819,l*0.00254
                  // height: 80,
                  // height: l*0.2037,
                  height: l * 0.1527,
                  child: Center(
                      child: Text("MATH PUZZLES",
                          style: TextStyle(
                              fontFamily: Font,
                              color: Colors.blue[900],
                              fontSize: 24))),
                ),
                Center(
                  child: Container(
                    // height: 550,
                    height: l * 1.32407,
                    // width: 392.72727272727275,
                    width: l,
                    margin: EdgeInsets.all(l * 0.0509259259259224),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/blackboard_main_menu.png"),
                            fit: BoxFit.fill)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                print("Tap on continue");
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return first_page(level);
                                  },
                                ));
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(l * .03819),
                              height: l * 0.1273,
                              width: l * 0.38194,
                              child: Text("  CONTINUE",
                                  style: TextStyle(
                                      fontFamily: Font,
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                print(
                                    "------------Tap on puzzle--------------");
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return puzzle_level(level);
                                  },
                                ));
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.all(l * .03819),
                                height: l * 0.1273,
                                width: l * 0.38194,
                                child: Text("  PUZZLES",
                                    style: TextStyle(
                                        fontFamily: Font,
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                print("------Tap on Buy pro-----------------");
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.all(l * .03819),
                                height: l * 0.1273,
                                width: l * 0.38194,
                                child: Text("  BUY PRO",
                                    style: TextStyle(
                                        fontFamily: Font,
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Center(
                            child: Text("AD",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ))),
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                l * 0.05092, 0, 0, l * 0.01273),
                            height: l * 0.2546,
                            child: Image.asset("image/ltlicon.png")),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(l * 0.02291),
                              child: Image.asset("image/shareus.png"),
                              margin: EdgeInsets.fromLTRB(0, 0, 0, l * 0.012),
                              // height: 50,
                              height: l * 0.12731,
                              // width: 60,
                              width: l * 0.15277,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 3),
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.grey,
                                        Colors.white,
                                        Colors.grey
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft)),
                            ),
                            Container(
                              padding: EdgeInsets.all(l * 0.0254),
                              margin: EdgeInsets.fromLTRB(
                                  l * 0.01273, 0, l * 0.0509, l * 0.01273),
                              child: Image.asset("image/emailus.png"),
                              // height: 50,
                              // width: 60,
                              height: l * 0.12731,
                              width: l * 0.15277,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 3),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.grey,
                                      Colors.white,
                                      Colors.grey
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, l * 0.0509, 0),
                          // height: 50,
                          height: l * 0.12731,
                          // width: 130,
                          width: l * 0.3310,
                          child: Center(
                              child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                                fontSize: l * 0.0432,
                                fontWeight: FontWeight.bold),
                          )),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45, width: 3),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getlevel() async {
    Main_page.prefs = await SharedPreferences.getInstance();
    setState(() {
      // Main_page.sw = List.filled(75, "");

      level = Main_page.prefs!.getInt("level") ?? 0;
    });
    for (int i = 0; i < 75; i++) {
      String levalstatus = Main_page.prefs!.getString("status$i") ?? "pending";

      Main_page.sw.add(levalstatus);

      print("${levalstatus}");
    }
  }
}
