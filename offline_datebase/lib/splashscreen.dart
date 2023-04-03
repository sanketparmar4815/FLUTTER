import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:offline_datebase/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';
import 'homepage.dart';

class splashpage extends StatefulWidget {
  static SharedPreferences? prefe;
  static Database? db1;

  @override
  State<splashpage> createState() => _splashpageState();
}

class _splashpageState extends State<splashpage> {
  bool status = false;
  String name = "";
  String email = "";
  int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.asset('animation/newlottie.json'),
    ));
  }

  @override
  void initState() {

    super.initState();
    foraddpersonaldata();
    forlogindata();
  }

  void foraddpersonaldata() {

    MyDataBase().ForGetDataBase().then((value) {
      setState(() {
        splashpage.db1 = value;

        print("=====${splashpage.db1}");
      });
    });
  }

  Future<void> forlogindata() async {
    // Obtain shared preferences.
    splashpage.prefe = await SharedPreferences.getInstance();
    print("${status}********************************");

    setState(() {
      status = splashpage.prefe!.getBool("logininfo") ?? false;
      name = splashpage.prefe!.getString("getlname") ?? "Name";
      email = splashpage.prefe!.getString("getlemail") ?? "Email";
      id = splashpage.prefe!.getInt("getlid") ?? 1;
    });
    print("${id}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (status) {
        setState(() {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return homepage();
            },
          ));
        });
      } else {
        setState(() {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return signin();
            },
          ));
        });
      }
    });
  }
}
