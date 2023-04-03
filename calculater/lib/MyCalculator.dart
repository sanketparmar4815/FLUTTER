import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Myclacy(),
    debugShowCheckedModeBanner: false,
  ));
}
class Myclacy extends StatefulWidget {
  const Myclacy({Key? key}) : super(key: key);

  @override
  State<Myclacy> createState() => _MyclacyState();
}

class _MyclacyState extends State<Myclacy> {
  String dis = "";
  double first = 0;
  double second = 0;
  int count = 0;
  int view = 1;
  bool inverce = false;
  // double temp=0;
  bool check = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Calculator",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              )
          ),
        ),
        backgroundColor: Colors.black,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffe6d8c3),
                  border: Border(bottom: BorderSide(color: Colors.black87))),
              alignment: Alignment.bottomRight,
              child: Text("$dis ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  if(view%2==0)
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on 2nd---------------");
                              inverce = true;
                            });
                          },
                            child: Container(
                              child: Center(
                                child: Text("2nd",
                                    style: TextStyle(

                                    fontSize: 20)),
                              ),
                            ),
                          )),
                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on deg---------------");
                            });
                          },
                            child: Container(
                                child: Center(
                                  child: Text("deg",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                )
                            ),
                          )),

                           Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on sin---------------");
                            });
                          },
                            child: Container(
                                child: Center(
                              child: Text("sin",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            )
                            ),
                          )),


                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on cos---------------");
                            });
                            
                          },
                            child: Container(
                                child: Center(
                                  child: Text("cos",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                )

                            ),
                          )),
                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on tan---------------");
                            });
                            
                          },
                            child: Container(
                                child: Center(
                                  child: Text("tan",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                )

                            ),
                          )),

                        ],
                      ),
                    ),
                  if(view%2==0)
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on x rest to y ---------------");
                            });
                            
                          },
                            child: Container(
                              child: Center(
                                child: Text("2nd",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                            ),
                          )),
                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on lg---------------");
                            });
                          },
                            child: Container(
                                child: Center(
                                  child: Text("lg",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                )
                            ),
                          )),
                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on ln---------------");
                            });
                            
                          },
                            child: Container(
                                child: Center(
                                  child: Text("ln",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                )
                            ),
                          )),
                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on (---------------");
                            });

                          },
                            child: Container(
                                child: Center(
                                  child: Text("(",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                )

                            ),
                          )),
                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on )---------------");
                            });

                          },
                            child: Container(
                                child: Center(
                                  child: Text(")",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                )

                            ),
                          )),

                        ],
                      ),
                    ),
                  Expanded(
                    child: Row(
                      children: [
                        if(view%2==0)
                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on square root ---------------");
                            });

                          },
                            child: Container(
                              child: Center(child: Text("√X",style: TextStyle(fontSize: 24))),
                            ),
                          )),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              print("on tap button AC");
                              setState(() {
                                dis = "";
                                first = 0;
                                second = 0;
                                count = 0;
                              });
                            },
                            child: Container(
                              child: Center(
                                  child: Text("AC",
                                      style: TextStyle(
                                          color: Color(0xfffd4900),
                                          fontSize: 20))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                dis = dis.substring(0, dis.length - 1);
                                print("tap on backsapce");
                              });
                            },
                            child: Container(
                              child: Icon(Icons.backspace_outlined,
                                  color: Color(0xfffd4900)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              print("tap on %");

                              operator("%");
                              // first = double.parse(dis);
                              // dis = "";
                              // count = 5;
                            },
                            child: Container(
                              child: Center(
                                  child: Text(
                                    "%",
                                    style: TextStyle(
                                        color: Color(0xfffd4900),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              print("tap on /");
                              operator("/");
                              // first = double.parse(dis);
                              // dis = "";
                              // count = 4;
                            },
                            child: Container(
                              child: Center(
                                  child: Text(
                                    "÷",
                                    style: TextStyle(
                                        color: Color(0xfffd4900), fontSize: 30),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
    if(view%2==0)
    Expanded(child: InkWell(
      onTap: () {
        setState(() {
          print("---------------tap on factorial X!---------------");
        });

      },
      child: Container(
      child: Center(child: Text("X!",style: TextStyle(fontSize: 24))),
      ),
    )),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // dis = dis + "7";
                              // print("object==$dis");
                              getvalue("7");
                            },
                            child: Container(
                              child: Center(
                                  child: Text("7",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // dis = dis + "8";
                              getvalue("8");
                            },
                            child: Container(
                              child: Center(
                                  child: Text("8",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // dis = dis + "9";
                              getvalue("9");
                            },
                            child: Container(
                              child: Center(
                                  child: Text("9",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // first = double.parse(dis);
                              // dis = "";
                              // count = 3;
                              print("tap on *");
                              operator("*");
                            },
                            child: Container(
                              // color: Colors.white,
                              child: Center(
                                  child: Text(
                                    "×",
                                    style: TextStyle(
                                        color: Color(0xfffd4900), fontSize: 35),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        if(view%2==0)
                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on 1/x---------------");
                            });
                          },
                            child: Container(
                              child: Center(child: Text("1/x",style: TextStyle(fontSize: 24))),
                            ),
                          )),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // dis = dis + "4";
                              getvalue("4");
                            },
                            child: Container(
                              child: Center(
                                  child: Text("4",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // dis = dis + "5";
                              getvalue("5");
                            },
                            child: Container(
                              child: Center(
                                  child: Text("5",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // dis = dis + "6";
                              getvalue("6");
                            },
                            child: Container(
                              child: Center(
                                  child: Text("6",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // first = double.parse(dis);
                              // dis = "";
                              // count = 2;
                              print("==tap on -");
                              operator("-");
                            },
                            child: Container(
                              // color: Colors.white,
                              child: Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        color: Color(0xfffd4900), fontSize: 35),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        if(view%2==0)
                        Expanded(child: InkWell(
                          onTap: () {
                            setState(() {
                              print("---------------tap on pie---------------");
                            });
                          },
                          child: Container(
                            child: Center(child: Text("Π",style: TextStyle(fontSize: 24))),
                          ),
                        )),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // dis = dis + "1";
                              getvalue("1");
                            },
                            child: Container(
                              child: Center(
                                  child: Text("1",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // dis = dis + "2";
                              getvalue("2");
                            },
                            child: Container(
                              child: Center(
                                  child: Text("2",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // dis = dis + "3";
                              getvalue("3");
                            },
                            child: Container(
                              child: Center(
                                  child: Text("3",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // first = double.parse(dis);
                              // dis = "";
                              // count = 1;
                              print("==tap on +");
                              operator("+");
                            },
                            child: Container(
                              // color: Colors.white,
                              child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: Color(0xfffd4900), fontSize: 35),
                                  )),
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
                                print("-----------tap on multi menu-----------------");
                              });
                            },
                            child: Container(
                              child: IconButton(onPressed: () {
                                setState(() {

                                view++;

                                });
                                
                              }, icon: Icon(Icons.crop_rotate)),
                                // child: Icon(
                                // child: Icon(
                                //   Icons.crop_rotate,
                                //   color: Color(0xfffd4900),
                                // )
                              // Center(child: Text("00",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold) )),
                            ),
                          ),
                        ),
                        if(view%2==0)
                          Expanded(child: InkWell(onTap: () {
                            setState(() {
                              print("---------------tap on e---------------");
                            });
                          },
                            child: Container(
                              child: Center(child: Text("e",style: TextStyle(fontSize: 24))),
                            ),
                          )),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // dis = dis + "0";
                              getvalue("0");
                            },
                            child: Container(
                              child: Center(
                                  child: Text("0",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                dis = dis + ".";
                              });
                            },
                            child: Container(
                              child: Center(
                                  child: Text(".",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),

                        Expanded(
                          child: InkWell(
                            onTap: () {
                              print("==tap on =");
                              Answer("=");

                              // second = double.parse(dis);
                              // dis = "";
                              // if (count == 1) {
                              //   dis = "${first + second}";
                              // } else if (count == 2) {
                              //   dis = "${first - second}";
                              // } else if (count == 3) {
                              //   dis = "${first * second}";
                              // } else if (count == 4) {
                              //   dis = "${first / second}";
                              // } else {
                              //   dis = "${first % second}";
                              // }
                            },
                            child: Container(
                              height: 75,
                              child: Center(
                                  child: Text("=",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ))),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xfffd4900)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getvalue(String s) {
    print("=== on tap === $s ");
    setState(() {
      dis = dis + s;
    });
  }

  void operator(String op) {
    setState(() {
      double temp = first; //1) temp = 0
      print("==== temp ==== $temp");

      first = double.parse(dis);
      print("===== first ==== $first\n");

      if (count == 1) {
        first = first + temp;
      } else if (count == 2) {
        first = temp - first;
      } else if (count == 3) {
        first = temp * first;
      } else if (count == 4) {
        first = temp / first;
      }

      dis = "";
      if (op == "+") {
        count = 1;
      } else if (op == "-") {
        count = 2;
      } else if (op == "*") {
        count = 3;
      } else if (op == "/") {
        count = 4;
      } else if (op == "%") {
        count = 5;
      }
    });
  }

  void Answer(String s) {
    setState(() {
      second = double.parse(dis);
      dis = "";

      if (count == 1) {
        dis = "${first + second}";
      } else if (count == 2) {
        dis = "${first - second}";
      } else if (count == 3) {
        dis = "${first * second}";
      } else if (count == 4) {
        dis = "${first / second}";
      } else if (count == 5) {
        dis = "${first % second}";
      }
      count=0;
    });
  }
}