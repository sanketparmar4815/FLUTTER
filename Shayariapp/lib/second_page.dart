import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayariapp/animation_page.dart';
import 'package:shayariapp/third_page.dart';

class secondpage extends StatefulWidget {
  int ind;
  List shayri;
  List category;
  int cindex;
  List emoji;

  secondpage(this.ind, this.shayri, this.category, this.cindex,
      this.emoji); // secondpage(this.ind, this.shayri);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  PageController pg = PageController();
  Gradient g = LinearGradient(colors: GradientColors.pink);

  List<LinearGradient> lg = [
    LinearGradient(colors: GradientColors.pink),
    LinearGradient(colors: GradientColors.amyCrisp),
    LinearGradient(colors: GradientColors.warmFlame),
    LinearGradient(colors: GradientColors.nightFade),
    LinearGradient(colors: GradientColors.sunnyMorning),
    LinearGradient(colors: GradientColors.dustyGrass),
    LinearGradient(colors: GradientColors.morpheusDen),
    LinearGradient(colors: GradientColors.itmeoBranding),
    LinearGradient(colors: GradientColors.redSalvation),
    LinearGradient(colors: GradientColors.nightParty),
    LinearGradient(colors: GradientColors.phoenixStart),
    LinearGradient(colors: GradientColors.eternalConstance),
    LinearGradient(colors: GradientColors.strongStick),
    LinearGradient(colors: GradientColors.leCocktail),
    LinearGradient(colors: GradientColors.riverCity),
    LinearGradient(colors: GradientColors.plumBath),
    LinearGradient(colors: GradientColors.colorfulPeach),
    LinearGradient(colors: GradientColors.marbleWall),
    LinearGradient(colors: GradientColors.happyMemories),
    LinearGradient(colors: GradientColors.blackGray),
    LinearGradient(colors: GradientColors.desertHump),
    LinearGradient(colors: GradientColors.skyGlider),
    LinearGradient(colors: GradientColors.blessingGet),
    LinearGradient(colors: GradientColors.meanFruit),
  ];

  // color: Color(0xff61876E)
  Color cardcolor = Color(0xff61876E);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pg = PageController(initialPage: widget.ind);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.category[widget.cindex]}",
            style: TextStyle(fontSize: 24)),
        backgroundColor: Color(0xff61876E),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: double.infinity,
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return animation_page(widget.shayri.length);
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 90,
                    ),
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage("image/fullscreen.png"),
                      color: Color(0xff61876E),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: Center(
                      child: Text(
                    "${widget.ind + 1}" + "/" + "${widget.shayri.length}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff61876E),
                        fontSize: 24),
                  )),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      lg.shuffle(Random());
                      g = lg[widget.ind];
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 90),
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.refresh,
                      color: Color(0xff61876E),
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pg,
              onPageChanged: (value) {
                setState(() {
                  widget.ind = value;
                  // pg.jumpToPage(widget.ind);
                });
              },
              itemCount: widget.shayri.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 150),
                  decoration: BoxDecoration(gradient: g, boxShadow: [
                    BoxShadow(
                      color: Color(0x40000000),
                      blurRadius: 8,
                      spreadRadius: 8,
                      offset: Offset(1, 1),
                    )
                  ]),
                  child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      // margin: EdgeInsets.fromLTRB(10, 20, 10, 150),
                      child: Center(
                          child: Text(
                        "${widget.shayri[widget.ind]} ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ))),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 50),
            height: 60,
            width: double.infinity,
            color: Color(0xffA6BB8D),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    FlutterClipboard.copy("${widget.shayri[widget.ind]}").then(
                        (value) => Fluttertoast.showToast(
                            backgroundColor: Color(0xff3C6255),
                            msg: "  SHAYRI COPIED  ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Color(0xffA6BB8D),
                    child: Icon(Icons.file_copy, color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      print("left tap on");
                      if (widget.ind != 0) {
                        widget.ind--;
                        pg.previousPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.ease);
                      }
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Color(0xffA6BB8D),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return third_page(
                          widget.shayri[widget.ind],
                          widget.emoji,
                        );
                      },
                    ));
                  },
                  child: Container(
                      height: 40,
                      width: 40,
                      color: Color(0xffA6BB8D),
                      child: Image(image: AssetImage("image/pencil.png"))),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      print("tap on right");

                      if (widget.ind < widget.shayri.length - 1) {
                        widget.ind++;
                        pg.nextPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.ease);
                      }
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Color(0xffA6BB8D),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Share.share("${widget.shayri[widget.ind]}");
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Color(0xffA6BB8D),
                    child: Icon(Icons.share, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
