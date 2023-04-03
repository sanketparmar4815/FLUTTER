import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offline_datebase/database.dart';
import 'package:offline_datebase/splashscreen.dart';
import 'package:sqflite/sqflite.dart';

import 'homepage.dart';
import 'signup.dart';

class signin extends StatefulWidget {
  static Database? db;

  signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  bool PasswordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    PasswordVisible = true;
    forinsertdata();

  }

  bool eyevisibile = false;
  TextEditingController mailid = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/01.png"), fit: BoxFit.cover)),
          child: Stack(children: [
            Container(
                margin: EdgeInsets.only(top: 190),
                height: 480,
                width: 350,
                child: Card(
                  color: Color(0xffCFD2CF),
                  elevation: 15,
                  shadowColor: Color(0xff7A86B6),
                )),
            Positioned(
              top: 220,
              left: 15,
              child: Text("SIGN IN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xff060047))),
            ),
            Positioned(
                left: 15,
                top: 300,
                height: 100,
                width: 300,
                child: TextField(
                  controller: mailid,
                  cursorColor: Color(0xff060047),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff060047)),
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Email-ID",
                      fillColor: Colors.white54,
                      labelStyle: TextStyle(color: Color(0xff060047)),
                      focusColor: Color(0xff060047),
                      filled: true,
                      prefixIcon: Icon(Icons.person, color: Color(0xff060047))),
                )),
            Positioned(
                left: 15,
                top: 380,
                height: 100,
                width: 300,
                child: TextField(
                  controller: password,
                  onChanged: (value) {
                    setState(() {
                      if (value.isNotEmpty) {
                        eyevisibile = true;
                      } else {
                        eyevisibile = false;
                      }
                    });
                  },
                  cursorColor: Color(0xff060047),
                  obscureText: PasswordVisible,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff060047)),
                      ),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Color(0xff060047)),
                      labelText: "Password",
                      fillColor: Colors.white54,
                      focusColor: Color(0xff060047),
                      filled: true,
                      suffixIcon: Visibility(
                        visible: eyevisibile,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              print("Tap on show password");
                              PasswordVisible = !PasswordVisible;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye,
                              color: Color(0xff060047)),
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock, color: Color(0xff060047))),
                )),
            Positioned(
                left: 15,
                top: 480,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(300, 55),
                        backgroundColor: Color(0xff060047)),
                    onPressed: () {
                      setState(() {
                        print(
                            "-------------tap on sign in button ---------------");
                        MyDataBase()
                            .forlogindata(
                                mailid.text, password.text, signin.db!)
                            .then((value) {
                          if (value.length == 1) {
                            String lname = value[0]["NAME"];
                            String lemail = value[0]["EMAIL"];
                            int lid = value[0]["ID"];

                            print("${lid}+++++++++++++++++++++++++");
                            setState(() {
                              splashpage.prefe!.setString("getlname", lname);
                              splashpage.prefe!.setString("getlemail", lemail);
                              splashpage.prefe!.setInt("getlid", lid);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text("Login Sucessfully"),
                              duration: const Duration(seconds: 1),
                            ));
                            setState(() {
                              splashpage.prefe!.setBool("logininfo", true);
                            });
                            print("//////////////////////////$lname");
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return homepage();
                                },
                              ));
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text("User not found"),
                              duration: const Duration(seconds: 1),
                            ));
                          }
                        });
                      });
                    },
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(fontSize: 20),
                    ))),
            Positioned(
                left: 120,
                top: 545,
                child: Text("Forgot Password?",
                    style: TextStyle(
                        color: Color(0xff7A86B6),
                        fontWeight: FontWeight.bold))),
            Positioned(
                width: 300,
                height: 50,
                top: 570,
                left: 25,
                child: Center(
                    child: RichText(
                        text: TextSpan(children: [
                  TextSpan(
                      text: "already have a account?",
                      style: TextStyle(
                          color: Color(0xff7A86B6),
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print(
                              '-------------------Tap on sign up --------------------');

                          setState(() {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return signup();
                              },
                            ));
                          });
                        },
                      text: " SIGN UP",
                      style: TextStyle(
                          color: Color(0xff060047),
                          fontWeight: FontWeight.bold))
                ])))),
          ]),
        ),
      ),
    );
  }

  void forinsertdata() {
    setState(() {
      MyDataBase mm = MyDataBase();
      mm.ForGetDataBase().then((value) {
        signin.db = value;
      });
    });
  }
}
