import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayariapp/second_page.dart';

class third_page extends StatefulWidget {
  String shayri;
  List emoji;

  third_page(this.shayri, this.emoji);

  @override
  State<third_page> createState() => _third_pageState();
}

class _third_pageState extends State<third_page> {
  Color clr = Color(0xffA6BB8D);
  Color tclr = Colors.black;

  List<Color> clrs = [
    Colors.yellow,
    Colors.orange,
    Colors.greenAccent,
    Colors.deepOrange,
    Colors.pink,
    Colors.white10,
    Colors.black45,
    Colors.grey,
    Colors.deepOrangeAccent,
    Colors.cyan,
    Color(0xff8EA7E9),
    Color(0xffFFD4D4),
    Color(0xffCDE990),
    Color(0xff567189),
    Color(0xffFAD6A5),
    Color(0xff03C988),
    Color(0xffFDA769),
    Color(0xff4E6C50),
    Color(0xffF0997D),
    Color(0xffEAC7C7),
    Color(0xffB08BBB),
    Color(0xff3C6255),
    Color(0xff82AAE3),
    Color(0xffBFEAF5),
    Color(0xffCEEDC7),
    Color(0xff85586F),
    Color(0xffF8F988),
    Color(0xffCE7777),
    Color(0xffADE792),
  ];

  String emoj = "😍 ❤ 😊 💕 😜 💖 😎 😉🤞";
  double fsize = 20;
  List style = ["f1", "f2", "f3", "f4", "f5"];
  String fstyle = "";
  GlobalKey globalKey = GlobalKey();

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);



  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  String folderPath = "";

  _createFolder()async{
    final folderName="Shayari App";
    final pathss= Directory("storage/emulated/0/DCIM/$folderName");
    if ((await pathss.exists())){
      // TODO:
      print("exist");
    }else{
      // TODO:
      print("not exist");
      pathss.create();
    }
    folderPath = pathss.path;
    setState(() {

    });
  }
  void changeColor(Color color) {
    setState(() => clr = color);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createFolder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Love Shayari", style: TextStyle(fontSize: 24)),
        backgroundColor: Color(0xff61876E),
        actions: [],
      ),
      body: Column(
        children: [

          Expanded(
            flex: 3,
            child: Container(
                margin: EdgeInsets.fromLTRB(10, 50, 10, 150),

                child: RepaintBoundary(
                  key: globalKey,
                  child: Card(
                    color: clr,
                    elevation: 20,
                    child: Center(
                      child: Text("   ${emoj}\n   ${widget.shayri}   \n  ${emoj}",
                          style: TextStyle(
                            fontSize: fsize,
                            color: tclr,
                            fontFamily: fstyle,
                            // fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                )),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          // flex: 2,
                          child: Container(
                            // color: Color(0xffA6BB8D),
                            margin: EdgeInsets.all(1),
                            child: Icon(
                              Icons.refresh,
                              color: Color(0xffA6BB8D),
                              size: 35,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(

                            child: IconButton(onPressed: () {
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  title: const Text('Pick a color!'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: pickerColor,
                                      onColorChanged: changeColor,
                                    ),

                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: const Text('Got it'),
                                      onPressed: () {
                                        setState(() => currentColor = pickerColor);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },);
                            }, icon: Icon(Icons.colorize_outlined,color: Color(0xffA6BB8D),size: 35,)),


                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        // Expanded(
                        //   // flex: 2,
                        //   child: Container(
                        //     color: Color(0xffA6BB8D),
                        //     margin: EdgeInsets.all(5),
                        //     child: Image(
                        //       color: Colors.white,
                        //       image: AssetImage("image/fullscreen.png"),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    color: Color(0xffA6BB8D),
                                    height: 250,
                                    width: 250,
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 8),
                                      itemCount: clrs.length,
                                      itemBuilder: (context, index) {
                                        if (index == 7) {
                                          return IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.close),
                                            color: Colors.deepOrange,
                                            iconSize: 35,
                                          );
                                        }

                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              print("tap on color");
                                              clr = clrs[index];
                                            });
                                          },
                                          child: Container(
                                            color: clrs[index],
                                            // child: Text("${index}"),
                                            margin: EdgeInsets.all(5),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              //padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              color: Color(0xffA6BB8D),
                              child: Center(
                                child: Text(
                                  "Background",
                                  style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    color: Color(0xffA6BB8D),
                                    height: 200,
                                    width: 100,
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 8),
                                      itemCount: clrs.length,
                                      itemBuilder: (context, index) {
                                        if (index == 7) {
                                          return IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.close),
                                            color: Colors.deepOrange,
                                            iconSize: 35,
                                          );
                                        }

                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              print("tap on text color");
                                              tclr = clrs[index];
                                            });
                                          },
                                          child: Container(
                                            color: clrs[index],
                                            // child: Text("${index}"),
                                            margin: EdgeInsets.all(5),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),

                              color: Color(0xffA6BB8D),
                              child: Center(
                                  child: Text(
                                "Text Color",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _capturePng().then((value) async {
                                       print(value);
                                       String imagename = "${DateTime.now().millisecondsSinceEpoch}" ".png";
                                String imagepath ="$folderPath/$imagename";
                                File ff = File(imagepath);
                                ff.writeAsBytes(value);

                                 await ff.create();

                                       Share.shareFiles(['${ff.path}'], );

                              });

                            },
                            child: Container(
                              margin: EdgeInsets.all(5),

                              color: Color(0xffA6BB8D),
                              child: Center(
                                  child: Text(
                                "Share",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 150,
                                    width: 150,
                                    color: Color(0xffA6BB8D),
                                    child: ListView.builder(
                                      itemCount: style.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () {
                                              setState(() {
                                                print("tap on font");
                                                fstyle = style[index];
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Container(
                                              child: Container(
                                                margin: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Color(0xffEAE7B1)),
                                                child: ListTile(
                                                    title: Text(
                                                  "shayri",
                                                  style: TextStyle(
                                                      fontFamily: style[index]),
                                                )),
                                              ),
                                            ));
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),

                              color: Color(0xffA6BB8D),
                              child: Center(
                                  child: Text(
                                "Font",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      color: Color(0xffA6BB8D),
                                      height: 200,
                                      margin: EdgeInsets.all(5),
                                      child: ListView.builder(
                                        itemCount: widget.emoji.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            color: Color(0xffEAE7B1),
                                            margin: EdgeInsets.all(5),
                                            child: ListTile(
                                              onTap: () {
                                                setState(() {
                                                  // emoj = emo[index];
                                                  emoj = widget.emoji[index];
                                                });
                                              },
                                              title: Text("${widget.emoji[index]}"),
                                            ),
                                          );
                                        },
                                      ));
                                },
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),

                              color: Color(0xffA6BB8D),
                              child: Center(
                                  child: Text(
                                "Emoji",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 150,
                                    child: StatefulBuilder(
                                      builder: (context, setState1) {
                                        return Slider(
                                          value: fsize,
                                          min: 10,
                                          max: 40,
                                          thumbColor: Color(0xff61876E),
                                          activeColor: Color(0xff61876E),
                                          inactiveColor: Color(0xFFA6BB8D),
                                          label: "$fsize",
                                          onChanged: (value) {
                                            setState1(() {
                                              setState(() {
                                                fsize = value;
                                              });
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),

                              color: Color(0xffA6BB8D),
                              child: Center(
                                  child: Text(
                                "Text Size",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
