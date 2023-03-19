import 'package:flutter/material.dart';
import 'package:practical/homepage.dart';
import 'package:practical/qwre.dart';
import 'package:practical/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class splashscreen extends StatefulWidget {
  static SharedPreferences? prefs;

  // static Database? db;

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  bool status = true;
  String email = "";
  String date = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forsharepref();
    // forcreatedatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("waiting")),
    );
  }

  Future<void> forsharepref() async {
// Obtain shared preferences.
    splashscreen.prefs = await SharedPreferences.getInstance();

    setState(() {
      status = splashscreen.prefs!.getBool("logininfo") ?? false;
      email =
          splashscreen.prefs!.getString("emailinfo") ?? "please enter a email";
      date = splashscreen.prefs!.getString("dateinfo") ?? "please enter a date";
    });
    print("----------------------${status}");
    print("----------------------${email}");
    print("----------------------${date}");
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (status) {
        setState(() {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return homepageone();
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
