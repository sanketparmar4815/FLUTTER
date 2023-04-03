import 'dart:convert';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';

class firstpage extends StatefulWidget {
  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  final FlutterTts tts = FlutterTts();

  final player = AudioPlayer(); // Create a player

  late ConfettiController _centerController;
  List someImages = [];
  int word = 0;
  String ll = "";
  String wts = "";

  String ansli = "";
  List anslist = [];
  List randomchar = [];
  List bottomlist = [];
  List toplist = [];
  Map map = {};


  int rightans = 0;
  Color correct = Colors.black;
  bool fixchar = false;

  Home() {
    tts.setLanguage('en');
    tts.setSpeechRate(0.4);
  }

  LoadMusic() async {
    await player.setAsset("mUSIC/asdf.mp3");
    await player.setLoopMode(LoopMode.one);
  }

  PlayMusic() async {
    await player.play();
  }

  PlayStop() async {
    await player.stop();
  }

  PlayPause() async {
    await player.pause();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LoadMusic();
    // PlayMusic();
    initImages();
    Home();
    _centerController =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    // dispose the controller
    _centerController.dispose();
    super.dispose();
  }

  Future initImages() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/'))
        .where((String key) => key.contains('.webp'))
        .toList();

    setState(() {
      someImages = imagePaths;
      print("$someImages");
    });
    int rr = Random().nextInt(someImages.length);
    print("$rr");
    ll = someImages[rr];

    // String ll = someImages[163];
    print("$ll");

    // List<String> ll1 = ll.split("/");
    // print("${ll1}");
    // List<String> ll2 = ll1[1].split("\.");
    // print("${ll2[0]}");

    // List anslist = ll.split("/")[1].split("\.")[0].split("");
    ansli = ll.split("/")[1].split("\.")[0].toUpperCase();
    anslist = ansli.split("");
    print("%%%%%%%$ansli");
    wts = ansli;
     Text txt= new Text(wts);
      txt = Text("${wts}");

    print("${anslist}");
    print("${anslist.length}");
    word = anslist.length;

    String abcd = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    List abcdlist = abcd.split("");
    abcdlist.shuffle();
    print("${abcdlist}");

    toplist = List.filled(anslist.length, "");

    bottomlist = abcdlist.getRange(0, 10 - anslist.length).toList();

    bottomlist.addAll(anslist);
    
    bottomlist.shuffle();
    print("$bottomlist");
  }

  // TextEditingController controller = TextEditingController(text:"" );



  @override
  Widget build(BuildContext context) {
    print("$rightans*****");
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                height: 50,
                width: double.infinity,
                child: Center(
                    child:
                        Text("GUESS THE WORD", style: TextStyle(fontSize: 24))),
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: ll != ""
                    ? Image.asset(
                        "${ll}",
                        height: 100,
                      )
                    : Container(),
              ),
              Container(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(word, (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            print("on tap ====$index");
                            if (!fixchar == true) {
                              if (toplist[index] != 0) {
                                bottomlist[map[index]] = toplist[index];
                                toplist[index] = "";
                                rightans = 0;
                              }
                            }
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Center(
                              child: Text(
                            "${toplist[index]}",
                            style: TextStyle(
                                // foreground: Paint(),
                                // style = PaintingStyle.stroke
                                // strokeWidth = 10
                                // color = Colors.red,
                                fontSize: 25,
                                // color: rightans == 1
                                //     ? Colors.green
                                //     : rightans == 2
                                //         ? Colors.red
                                //         : Colors.black,
                                color: rightans == 1
                                    ? Colors.green
                                    : rightans == 2
                                        ? toplist[index] != anslist[index]
                                            ? Colors.red
                                            : Colors.green
                                        : Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.grey,
                              boxShadow: [
                                BoxShadow(
                                    color: rightans == 1
                                        ? Colors.green
                                        : rightans == 2
                                            ? Colors.red
                                            : Colors.black,
                                    // color: Colors.black,
                                    // color: correct,
                                    blurRadius: 10,
                                    spreadRadius: 2)
                              ]),
                          margin: EdgeInsets.all(5),
                        ),
                      );
                    }),
                  )),
              SizedBox(height: 10),
              Center(
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                rightans = 0;

                                fixchar = false;
                                initImages();
                              });
                            },
                            icon: Icon(Icons.refresh)),
                        IconButton(
                            onPressed: () {
                              // tts.speak(controller.text);
                              tts.speak(wts);
                            },
                            icon: Icon(Icons.volume_up))
                      ]),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                height: 160,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: bottomlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          print("on tapp ---- ${bottomlist[index]}");
                          for (int i = 0; i < toplist.length; i++) {
                            if (toplist[i] == "") {
                              toplist[i] = bottomlist[index];
                              map[i] = index;
                              bottomlist[index] = "";
                            }
                          }
                          correctanscheck();
                          if (rightans == 1) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Container(
                                  color: Colors.black26,
                                  child: Stack(children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: ConfettiWidget(
                                        confettiController: _centerController,
                                        blastDirection: pi / 2,
                                        maxBlastForce: 10,
                                        minBlastForce: 1,
                                        emissionFrequency: 0.03,
                                        numberOfParticles: 10,
                                        gravity: 0,
                                      ),
                                    ),
                                    Positioned(
                                      top: 200,
                                      child: Container(
                                        height: 200,
                                        width: 200,
                                        child: Image(
                                            image: AssetImage(
                                                "background/rays.png")),
                                      ),
                                    ),
                                    Positioned(
                                      top: 700,
                                      left: 150,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              rightans = 0;
                                              fixchar = false;

                                              initImages();
                                            });
                                          },
                                          child: Text("NEXT")),
                                    )
                                  ]),
                                  // color: Colors.blue,
                                );
                              },
                            );
                          }
                          if (rightans == 2) {
                            for (int i = 0; i < anslist.length; i++) {
                              if (toplist[i] == anslist[i]) {}
                            }
                          }
                        });
                      },
                      child: Container(
                        child: Center(
                            child: Text(
                          "${bottomlist[index]}",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                        decoration: bottomlist[index].isNotEmpty
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 2,
                                      offset: Offset(0, 1))
                                ],
                                color: Colors.yellow,
                                border: Border.all(color: Colors.black))
                            : BoxDecoration(color: Colors.grey),
                        margin: EdgeInsets.all(5),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void correctanscheck() {
    print("${listEquals(toplist, anslist)}+++++");
    print("$toplist))))))");
    print("$anslist(((((");

    if (!toplist.contains('')) {
      if (listEquals(toplist, anslist)) {
        fixchar = true;
        rightans = 1;
        _centerController.play();
      } else {
        rightans = 2;
      }
    }
  }
}
