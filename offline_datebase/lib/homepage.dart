import 'package:flutter/material.dart';
import 'package:offline_datebase/splashscreen.dart';

import 'Update.dart';
import 'database.dart';
import 'homepagedata.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Map> pda = [];
  List<Map> SerachList = [];

  @override
  void initState() {
    super.initState();
    // forgetlogininfo();
    viewpersonaldata();
    // viewlogininfo();
  }

  String? name;
  String? email;
  bool Isearch = false;
  int count = 1;
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double appsize = MediaQuery.of(context).size.height;
    double size = MediaQuery.of(context).padding.top;

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
        appBar: AppBar(
          backgroundColor: Color(0xff060047),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    count = count + 1;
                    if (count % 2 == 0) {
                      Isearch = true;
                    } else {
                      Isearch = false;
                    }
                  });
                },
                icon: Icon(Icons.search))
          ],
        ),
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
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            context: context,
                            builder: (context) {
                              return Container(
                                color: Color(0xff7A86B6),
                                height: 200,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text("Pick Profile Picture",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25)),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                print("----tap on galery----");
                                              });
                                            },
                                            child: Container(
                                              height: 125,

                                              // color: Colors.black38,
                                              child: Image(
                                                  image: AssetImage(
                                                "image/add_image.png",
                                              )),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                print("----tap on camera----");
                                              });
                                            },
                                            child: Container(
                                              height: 125,

                                              // color: Colors.black38,
                                              child: Image(
                                                  image: AssetImage(
                                                "image/camera.png",
                                              )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
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
        body: Column(
          children: [
            Visibility(
              visible: Isearch,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 45,
                width: double.infinity,
                // color: Color(0xffBAD7E9),
                color: Colors.white10,
                child: Isearch
                    ? TextField(
                        onChanged: (value) {
                          print("------$value");
                          setState(() {
                            if (value.isNotEmpty) {
                              SerachList = [];
                              for (int i = 0; i < pda.length; i++) {
                                String nammee = pda[i]['NAME'];
                                String number = pda[i]['CONTACTNUBER'];
                                if (nammee
                                        .toLowerCase()
                                        .contains(value.toLowerCase()) ||
                                    number.toString().contains(value)) {
                                  SerachList.add(pda[i]);
                                }
                              }
                              print("$SerachList");
                            } else {
                              SerachList = pda;
                            }
                          });
                        },
                        controller: search,
                        cursorColor: Color(0xff060047),
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          iconColor: Color(0xff060047),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff060047),
                            ),
                          ),
                          // fillColor: Colors.black12,
                          focusColor: Color(0xff060047),
                          prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                Isearch = false;
                                SerachList = pda;
                              });
                            },
                            icon: Icon(Icons.keyboard_arrow_left),
                            color: Color(0xff060047),
                          ),
                        ),
                      )
                    : Container(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Isearch ? SerachList.length : pda.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff7A86B6),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      trailing: PopupMenuButton(
                        onSelected: (value) {
                          print(
                              "---------------------${value}------------------");
                          if (value == 1) {}
                        },
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                                value: 1,
                                child: TextButton(
                                  onPressed: () {
                                    // MyDataBase.updatedata(
                                    //   splashpage.db1,

                                    // );
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Update(pda[index]),
                                        ));
                                  },
                                  child: Text("UPDATE",
                                      style:
                                          TextStyle(color: Color(0xff060047))),
                                )),
                            PopupMenuItem(
                                value: 2,
                                child: TextButton(
                                  onPressed: () {
                                    MyDataBase()
                                        .deletedata(
                                            splashpage.db1!, pda[index]['ID'])
                                        .then((value) {
                                      setState(() {
                                        viewpersonaldata();
                                      });
                                    });

                                    Navigator.pop(context);
                                  },
                                  child: Text("DELETE",
                                      style:
                                          TextStyle(color: Color(0xff060047))),
                                ))
                          ];
                        },
                      ),
                      title: Isearch
                          ? Text("${SerachList[index]['NAME']}")
                          : Text("${pda[index]['NAME']}"),
                      subtitle: Isearch
                          ? Text("${SerachList[index]['CONTACTNUBER']}")
                          : Text("${pda[index]['CONTACTNUBER']}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  viewpersonaldata() {
    int udri = splashpage.prefe!.getInt("getlid") ?? 0;

    MyDataBase().viewpersonaldata(splashpage.db1!, udri).then((value) {
      setState(() {
        pda = value;
        SerachList = value;

        print("A====$pda");
      });
    });
  }
}
