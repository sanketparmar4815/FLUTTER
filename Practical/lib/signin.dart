import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practical/database.dart';
import 'package:practical/homepage.dart';
import 'package:practical/qwre.dart';
import 'package:practical/splashscreen.dart';
import 'package:sqflite/sqflite.dart';

class signin extends StatefulWidget {
  static Database? db;

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forgetdatabases();
  }
  TextEditingController dateInput = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Text("Sign in "),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                height: 100,
                width: 350,
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      labelText: "Email", border: OutlineInputBorder()),
                ),
              ),
            ),
            Container(
              width: 350,
              child: Center(
                child: TextField(
                  controller: dateInput,
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: "Enter Date"),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(pickedDate);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate);
                      setState(() {
                        dateInput.text = formattedDate;
                      });
                    } else {}
                  },
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    MyDataBase()
                        .forlogindata(email.text, dateInput.text, signin.db!)
                        .then((value) {
                      if (value.length == 1) {
                        String emailq = value[0]["email"];
                        String dateq = value[0]["date"];
                        print("${emailq}+++++++++++++++++++++++++");
                        print("${dateq}+++++++++++++++++++++++++");


                        setState(() {
                          splashscreen.prefs!.setString("emailinfo", emailq.toString());
                          splashscreen.prefs!.setString("dateinfo", dateq.toString());
                          splashscreen.prefs!.setBool("logininfo", true);
                        });
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return homepageone();
                            },
                          ));


                        });



                        // setState(() {
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return homepage1();
                          //   },
                          // ));
                        // });
                      }
                    });
                  });
                },
                child: Text("Sign in")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return quetion123();
                    },
                  ));
                },
                child: Text("register"))
          ],
        ),
      ),
    );
  }

  void forgetdatabases() {
    setState(() {
      MyDataBase mm = MyDataBase();
      mm.forgetdatabase().then((value) {
        signin.db = value;
      });
    });
  }
}
