import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';

import 'databse.dart';

class firstpage extends StatefulWidget {
  static Database? db;



  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {

  bool isGrid = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forgetdatabase();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 45),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xffe8f2f3)),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 5),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            print("Tap on drwaer");
                          });
                          Drawer(
                            child: ListView(children: [
                              ListTile(
                                title: Text("First"),
                              )
                            ]),
                          );
                        },
                        icon: Icon(Icons.menu))),
                Expanded(child: Text('Search your notes')),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    icon: getIcon(isGrid)),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 36,
                  width: 36,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: CircleAvatar(child: Text("s")),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            child: Column(
              children: [
                Icon(Icons.lightbulb_outline,
                    color: Color(0xfff4b400), size: 150),
                Text(
                  "Notes you add appear here",
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffe8f2f3),
        notchMargin: 5,
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ), // StadiumBorder(),
        ),
        child: IconTheme(
            data: IconThemeData(color: Colors.white, size: 25),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.check_box_outlined,
                          color: Colors.black)),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.brush_outlined,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mic_none_outlined,
                          color: Colors.black)),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.photo_outlined,
                          color: Colors.black)),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {},
        backgroundColor: Color(0xffe8f2f3),
        child: Image.asset(
          "Images/gadd.png",
          fit: BoxFit.contain,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }

  Widget getIcon(bool isGrid) {
    return isGrid
        ? Icon(
            Icons.list,
            size: 28,
          )
        : Icon(
            Icons.window,
            size: 28,
          );
  }

  void forgetdatabase() {
    Mydatabase mm = Mydatabase();
    mm.forcreatedatabase();


  }
}
