import 'package:calc/components/Button.dart';
import 'package:calc/services/Calculator.dart';
import 'package:calc/themes.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String input;
  String output;
  String result;
  String exp;
  Calculator calculator;
  @override
  void initState() {
    input = "";
    output = "";
    result = "";
    calculator = new Calculator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFf8f9fa),
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    textAlign: TextAlign.end,
                    maxLength: 10,
                    decoration: InputDecoration(
                      enabled: false,
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintText: input,
                      hintStyle: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Rubik',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextField(
                    textAlign: TextAlign.end,
                    maxLength: 10,
                    decoration: InputDecoration(
                      enabled: false,
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintText: output,
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                color: kSecondaryColor,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  icon: Icon(
                                    Icons.backspace,
                                    color: Colors.white,
                                  ),
                                  color: kPrimaryColor,
                                  action: backSpace(),
                                  lonPressAction: () {
                                    setState(() {
                                      input = "";
                                      output = "";
                                    });
                                  },
                                ),
                                Button(
                                  text: "(",
                                  textStyle: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 20,
                                  ),
                                  color: Color(0xFFe9ecef),
                                  action: setText("("),
                                ),
                                Button(
                                  text: ")",
                                  textStyle: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 20,
                                  ),
                                  color: Color(0xFFe9ecef),
                                  action: () {
                                    setState(() {
                                      input += ")";
                                      result =
                                          calculator.solve(input) ?? result;
                                      output = "= " + result;
                                    });
                                  },
                                ),
                                Button(
                                  icon: Icon(
                                    MdiIcons.division,
                                    color: kPrimaryColor,
                                    size: 25,
                                  ),
                                  color: Color(0xFFe9ecef),
                                  action: setText("÷"),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(children: [
                              Button(
                                text: "7",
                                action: () {
                                  setState(() {
                                    input += "7";
                                    result = calculator.solve(input) ?? result;
                                    output = "= " + result;
                                  });
                                },
                              ),
                              Button(
                                text: "8",
                                action: () {
                                  setState(() {
                                    input += "8";
                                    result = calculator.solve(input) ?? result;
                                    output = "= " + result;
                                  });
                                },
                              ),
                              Button(
                                text: "9",
                                action: () {
                                  setState(() {
                                    input += "9";
                                    result = calculator.solve(input) ?? result;
                                    output = "= " + result;
                                  });
                                },
                              ),
                              Button(
                                icon: Icon(
                                  Icons.clear,
                                  color: kPrimaryColor,
                                  size: 25,
                                ),
                                color: Color(0xFFe9ecef),
                                action: setText("x"),
                              ),
                            ]),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Button(
                                  text: "4",
                                  action: () {
                                    setState(() {
                                      input += "4";
                                      result =
                                          calculator.solve(input) ?? result;
                                      output = "= " + result;
                                    });
                                  },
                                ),
                                Button(
                                  text: "5",
                                  action: () {
                                    setState(() {
                                      input += "5";
                                      result =
                                          calculator.solve(input) ?? result;
                                      output = "= " + result;
                                    });
                                  },
                                ),
                                Button(
                                  text: "6",
                                  action: () {
                                    setState(() {
                                      input += "6";
                                      result =
                                          calculator.solve(input) ?? result;
                                      output = "= " + result;
                                    });
                                  },
                                ),
                                Button(
                                  icon: Icon(
                                    MdiIcons.plus,
                                    color: kPrimaryColor,
                                    size: 25,
                                  ),
                                  color: Color(0xFFe9ecef),
                                  action: setText("+"),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Button(
                                  text: "1",
                                  action: () {
                                    setState(() {
                                      input += "1";
                                      result =
                                          calculator.solve(input) ?? result;
                                      output = "= " + result;
                                    });
                                  },
                                ),
                                Button(
                                  text: "2",
                                  action: () {
                                    setState(() {
                                      input += "2";
                                      result =
                                          calculator.solve(input) ?? result;
                                      output = "= " + result;
                                    });
                                  },
                                ),
                                Button(
                                  text: "3",
                                  action: () {
                                    setState(() {
                                      input += "3";
                                      result =
                                          calculator.solve(input) ?? result;
                                      output = "= " + result;
                                    });
                                  },
                                ),
                                Button(
                                  icon: Icon(
                                    MdiIcons.minus,
                                    color: kPrimaryColor,
                                    size: 25,
                                  ),
                                  color: Color(0xFFe9ecef),
                                  action: setText("-"),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Button(
                                  icon: Icon(
                                    MdiIcons.swapHorizontal,
                                    color: kPrimaryColor,
                                  ),
                                  action: getBottomSheet(),
                                ),
                                Button(
                                  text: "0",
                                  action: () {
                                    setState(() {
                                      input += "0";
                                      result =
                                          calculator.solve(input) ?? result;
                                      output = "= " + result;
                                    });
                                  },
                                ),
                                Button(
                                  text: ".",
                                  action: setText("."),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 5, bottom: 5),
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        String result = calculator.solve(input);
                                        output = result == null
                                            ? "ERROR"
                                            : "= " + result;
                                      });
                                    },
                                    fillColor: kPrimaryColor,
                                    elevation: 20,
                                    child: Icon(
                                      MdiIcons.equal,
                                      size: 23,
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(25.0),
                                    shape: CircleBorder(),
                                  ),
                                ),
                              ],
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
      ),
    );
  }

  Function setText(String text) {
    return () => setState(() {
      input += text;
    });
  }

  Function backSpace() {
    return () => setState(() {
      String lastTerm;
      if (input.length > 3) {
        lastTerm = input.substring(input.length - 4, input.length);
        if (lastTerm == "sin(" ||
            lastTerm == "cos(" ||
            lastTerm == "tan(" ||
            lastTerm == "log(" ||
            lastTerm == "inv(")
          input = input.substring(0, input.length - 3);
      }
      if (input.length > 4 && lastTerm == "qrt(")
        input = input.substring(0, input.length - 4);
      else if (input.endsWith("ln("))
        input = input.substring(0, input.length - 2);
      else if (input.length != 0)
        input = input.substring(0, input.length - 1);
      result = calculator.solve(input) ?? result;
      if (input == '')
        output = '';
      else
        output = "= " + result;
    });
  }

  Function getBottomSheet() {
    return () => showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
      backgroundColor: kPrimaryColor,
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Button(
                            text: "sin",
                            color: Colors.transparent,
                            action: setText("sin("),
                          ),
                          Button(
                            text: "cos",
                            color: Colors.transparent,
                            action: setText("cos("),
                          ),
                          Button(
                            text: "tan",
                            color: Colors.transparent,
                            action: setText("tan("),
                          ),
                          Button(
                            text: "log",
                            color: Colors.transparent,
                            action: setText("log("),
                          ),
                          Button(
                            text: "ln",
                            color: Colors.transparent,
                            action: setText("ln("),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Button(
                            text: "e",
                            color: Colors.transparent,
                            action: setText("e"),
                          ),
                          Button(
                            icon: Icon(
                              MdiIcons.percentOutline,
                              color: Colors.white,
                              size: 20,
                            ),
                            color: Colors.transparent,
                            action: setText("%"),
                          ),
                          Button(
                            text: "X!",
                            color: Colors.transparent,
                            action: setText("!"),
                          ),
                          Button(
                            icon: Icon(
                              MdiIcons.exponent,
                              color: Colors.white,
                            ),
                            color: Colors.transparent,
                            action: setText("^"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Button(
                            text: "",
                            icon: Icon(
                              MdiIcons.pi,
                              color: Colors.white,
                              size: 20,
                            ),
                            color: Colors.transparent,
                            action: setText("π"),
                          ),
                          Button(
                            text: "",
                            icon: Icon(
                              MdiIcons.squareRoot,
                              size: 25,
                              color: Colors.white,
                            ),
                            color: Colors.transparent,
                            action: setText("sqrt("),
                          ),
                          Button(
                            text: "1/x",
                            color: Colors.transparent,
                            action: setText("inv("),
                          ),
                          Button(
                            text: "",
                            color: Colors.transparent,
                          ),
                          Button(
                            text: "",
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}