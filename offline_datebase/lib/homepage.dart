import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offline_datebase/splashscreen.dart';

import 'database.dart';
import 'homepagedata.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Map> pda = [];

  @override
  void initState() {
    super.initState();
    // forgetlogininfo();
    viewpersonaldata();
    // viewlogininfo();
  }

  String? name;
  String? email;

  @override
  Widget build(BuildContext context) {
    double appsize = MediaQuery.of(context).size.height;
    double size = MediaQuery.of(context).padding.top;
    // double bsize = appsize - size;
    // double bwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: Color(0xff060047),
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                print("----- Tap on floatingAction button -------");
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return homedata();
                  },
                ));
              });
            },
          ),
        ),
        appBar: AppBar(backgroundColor: Color(0xff060047)),
        drawer: Drawer(
          child: ListView(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 190,
                      // child: Image(image: AssetImage("image/camera.png"),fit: BoxFit.contain,),
                      child: Center(
                          child: CircleAvatar(
                        backgroundColor: Color(0xff060047),
                        child: Text("A",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                      )),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff060047),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 175,
                    top: 150,
                    child: MaterialButton(
                        onPressed: () {
                          // showModalBottomSheet(
                          //   context: context, builder: (context) {
                          //
                          // },);
                        },
                        height: 50,
                        shape: CircleBorder(),
                        child: Icon(Icons.edit),
                        color: Color(0xff7A86B6)),
                  ),
                ],
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.pink,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: pda.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color(0xff7A86B6),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text("${pda[index]['NAME']}"),
                subtitle: Text("hello"),
              ),
            );
          },
        ),
      ),
    );
  }

  // void forgetlogininfo() {
  //   setState(() {
  //     name = splashpage.prefe!.getString("getlname") ?? "Name";
  //     email = splashpage.prefe!.getString("getlemail") ?? "Email";
  //     homepage.id = splashpage.prefe!.getInt("getlid") ?? 999;
  //   });
  //   print("${name}//////////////");
  // }
  viewpersonaldata() {
    int udri = splashpage.prefe!.getInt("getlid") ?? 0;

    MyDataBase().viewpersonaldata(splashpage.db1!, udri).then((value) {
      setState(() {
        pda = value;

        print("A====$pda");
      });
    });
  }
}
