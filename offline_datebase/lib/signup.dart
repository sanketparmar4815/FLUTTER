import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:offline_datebase/database.dart';
import 'package:offline_datebase/signin.dart';
import 'package:sqflite/sqflite.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController name = TextEditingController();
  TextEditingController mailid = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController contactnumber = TextEditingController();
  RegExp rex = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  RegExp mailrex = RegExp(r'\S+@\S+\.\S+');
  RegExp passwordrex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RegExp contectrex = RegExp(r"^(?:[+0]9)?[0-9]{10}$");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    PasswordVisible = true;
  }

  bool Nameerror = false;
  bool Mailerror = false;
  bool Passworderror = false;
  bool numbererror = false;
  bool PasswordVisible = false;
  bool eyevisibile = false;
  bool contact = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/03.png"), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 140),
                        height: 620,
                        width: 350,
                        child: Card(
                          color: Color(0xffCFD2CF),
                          shadowColor: Color(0xff7A86B6),
                          elevation: 15,
                          child: Column(children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 30, 80, 0),

                              // top: 160,
                              height: 50,
                              width: 200,
                              child: Text("SIGN UP",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Color(0xff060047))),
                            ),
                            Container(
                                // left: 15,
                                // top: 220,
                                height: 90,
                                width: 300,
                                child: TextField(
                                  controller: name,
                                  cursorColor: Color(0xff060047),
                                  decoration: InputDecoration(
                                      errorText:
                                          Nameerror ? "Enter your Name" : null,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff060047)),
                                      ),
                                      border: OutlineInputBorder(),
                                      helperText: "Ex-Donand J. Trump",
                                      labelText: "Name",
                                      fillColor: Colors.white54,
                                      labelStyle:
                                          TextStyle(color: Color(0xff060047)),
                                      focusColor: Color(0xff060047),
                                      filled: true,
                                      prefixIcon: Icon(Icons.person,
                                          color: Color(0xff060047))),
                                )),
                            Container(
                                // left: 15,
                                // top: 310,
                                // margin: EdgeInsets.only(bottom: 15 ),
                                height: 80,
                                width: 300,
                                child: TextField(
                                  controller: mailid,
                                  cursorColor: Color(0xff060047),
                                  decoration: InputDecoration(
                                      errorText: Mailerror
                                          ? "Please enter a valid email address"
                                          : null,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff060047)),
                                      ),
                                      border: OutlineInputBorder(),
                                      labelText: "Mail Id",
                                      fillColor: Colors.white54,
                                      labelStyle:
                                          TextStyle(color: Color(0xff060047)),
                                      focusColor: Color(0xff060047),
                                      filled: true,
                                      prefixIcon: Icon(Icons.email_outlined,
                                          color: Color(0xff060047))),
                                )),
                            Container(

                                // left: 15,
                                // top: 390,
                                height: 80,
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
                                      errorText: Passworderror
                                          ? "Please enter a valid Password"
                                          : null,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff060047)),
                                      ),
                                      border: OutlineInputBorder(),
                                      labelStyle:
                                          TextStyle(color: Color(0xff060047)),
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
                                              PasswordVisible =
                                                  !PasswordVisible;
                                            });
                                          },
                                          icon: Icon(Icons.remove_red_eye,
                                              color: Color(0xff060047)),
                                        ),
                                      ),
                                      prefixIcon: Icon(Icons.lock,
                                          color: Color(0xff060047))),
                                )),
                            Container(

                                // left: 15,
                                // top: 470,
                                height: 90,
                                width: 300,
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isNotEmpty) {
                                        contact = true;
                                      } else {
                                        contact = false;
                                      }
                                    });
                                  },
                                  controller: contactnumber,
                                  maxLength: 10,
                                  cursorColor: Color(0xff060047),
                                  decoration: InputDecoration(
                                    errorText: numbererror
                                        ? "Please enter a valid phone number"
                                        : null,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff060047)),
                                    ),
                                    border: OutlineInputBorder(),
                                    labelStyle:
                                        TextStyle(color: Color(0xff060047)),
                                    labelText: "Contact Number",
                                    counterText: contact ? null : "",
                                    // counterText: "",
                                    fillColor: Colors.white54,
                                    focusColor: Color(0xff060047),
                                    filled: true,
                                    prefixIcon: Icon(Icons.phone,
                                        color: Color(0xff060047)),
                                  ),
                                )),
                            Container(
                              // top: 560,
                              // left: 15,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(300, 55),
                                      backgroundColor: Color(0xff060047)),
                                  onPressed: () {
                                    setState(() {
                                      print(
                                          "----------------Tap on sign up ----------------");
                                      if (!rex.hasMatch(name.text)) {
                                        Nameerror = true;
                                      } else {
                                        Nameerror = false;
                                      }
                                      if (!mailrex.hasMatch(mailid.text)) {
                                        Mailerror = true;
                                      } else {
                                        Mailerror = false;
                                      }
                                      if (!passwordrex
                                          .hasMatch(password.text)) {
                                        Passworderror = true;
                                      } else {
                                        Passworderror = false;
                                      }
                                      if (!contectrex
                                          .hasMatch(contactnumber.text)) {
                                        numbererror = true;
                                      } else {
                                        numbererror = false;
                                      }

                                      if (rex.hasMatch(name.text) &&
                                          mailrex.hasMatch(mailid.text) &&
                                          passwordrex.hasMatch(password.text) &&
                                          contectrex
                                              .hasMatch(contactnumber.text)) {
                                        MyDataBase().insertdata(
                                            name.text,
                                            mailid.text,
                                            signin.db!,
                                            password.text);
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return signin();
                                          },
                                        ));
                                      }
                                    });
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ),
                            Container(
                                width: 300,
                                height: 50,
                                // top: 650,
                                // left: 15,
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
                                          setState(() {
                                            print('Tap on Sign in ');
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return signin();
                                              },
                                            ));
                                          });
                                        },
                                      text: " SIGN IN",
                                      style: TextStyle(
                                          color: Color(0xff060047),
                                          fontWeight: FontWeight.bold))
                                ])))),
                          ]),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
