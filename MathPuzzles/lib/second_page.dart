import 'package:flutter/material.dart';
import 'package:mathpuzzles/main.dart';

import 'first_page.dart';




class Second_page extends StatefulWidget {
  int level;

  Second_page(this.level);




  @override
  State<Second_page> createState() => _Second_pageState();
}

class _Second_pageState extends State<Second_page> {
  String Font = "chalk";

  @override
  Widget build(BuildContext context) {
    return WillPopScope( onWillPop: () {
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
    },
    child:  SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/background.jpg"), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                child: Center(
                    child: Text("PUZZLE ${widget.level} COMPLETED",
                        style: TextStyle(
                            fontFamily: Font,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 24))),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Center(child: Image.asset("image/trophy.png")),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return first_page(widget.level);
                    },));
                  },
                    child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 50,
                        width: 170,
                        child: Center(
                          child: Text("CONTINUE",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black)),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.grey, Colors.white, Colors.grey],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft),
                            borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black38,width: 2)
                        )),
                  ),
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Main_page();
                    },));
                  },
                    child: Container(margin: EdgeInsets.only(top: 10),
                        height: 50,
                        width: 170,
                        child: Center(
                          child: Text("MAIN MENU",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black)),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.grey, Colors.white, Colors.grey],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft),
                            borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black38,width: 2))),
                  ),
                  Container(margin: EdgeInsets.only(top: 10),
                    height: 50,
                    width: 170,
                    child: Center(
                      child: Text("BUY PRO",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black)),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.grey, Colors.white, Colors.grey],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                        borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black38,width: 2)),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(margin: EdgeInsets.only(top: 20),
                    child: Center(
                        child: Text(
                          "SHARE THIS PUZZLE",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.grey,
                          Colors.grey,
                          Colors.white10,
                          Colors.grey,
                          Colors.grey
                        ], begin: Alignment.topRight, end: Alignment.bottomLeft),borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black38,width: 2)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share, size: 45),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }


}
