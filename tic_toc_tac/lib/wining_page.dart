import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    home: Wining_page(),
    debugShowCheckedModeBanner: false,
  ));
}

class Wining_page extends StatefulWidget {
  const Wining_page({Key? key}) : super(key: key);

  @override
  State<Wining_page> createState() => _Wining_pageState();
}

class _Wining_pageState extends State<Wining_page> {
  bool celibration = false;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: flag
            ? Container(
                height: 100,
                width: 100,
                color: Colors.black,
              )
            : Container(
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
                              child: Text(" CONGRATULATIONS! ",
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
            ));
  }
}
