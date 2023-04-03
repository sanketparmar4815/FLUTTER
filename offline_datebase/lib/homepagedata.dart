import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offline_datebase/database.dart';
import 'package:offline_datebase/homepage.dart';
import 'package:offline_datebase/splashscreen.dart';

class homedata extends StatefulWidget {
  const homedata({Key? key}) : super(key: key);

  @override
  State<homedata> createState() => _homedataState();
}

class _homedataState extends State<homedata> {
  // Database? db1;
  TextEditingController hname = TextEditingController();
  TextEditingController hcontactnumber = TextEditingController();
  bool Nameerror = false;
  bool numbererror = false;
  bool contact = false;

  // int? id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          // color: Colors.orange,

          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/03.png"), fit: BoxFit.fill)),

          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(25, 150, 0, 0),
                height: 450,
                width: 340,
                child: Card(
                  color: Color(0xffCFD2CF),
                  elevation: 15,
                  shadowColor: Color(0xff7A86B6),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text("Enter Detail",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color(0xff060047))),
                      ),
                      Container(
                        height: 90,
                        width: 300,
                        margin: EdgeInsets.only(top: 50),
                        child: TextField(
                          controller: hname,
                          cursorColor: Color(0xff060047),
                          decoration: InputDecoration(
                              errorText: Nameerror ? "Enter your Name" : null,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff060047)),
                              ),
                              border: OutlineInputBorder(),
                              // helperText: "Ex-Donand J. Trump",
                              labelText: "Name",
                              fillColor: Colors.white54,
                              labelStyle: TextStyle(color: Color(0xff060047)),
                              focusColor: Color(0xff060047),
                              filled: true,
                              prefixIcon:
                                  Icon(Icons.person, color: Color(0xff060047))),
                        ),
                      ),
                      Container(
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
                          controller: hcontactnumber,
                          maxLength: 10,
                          cursorColor: Color(0xff060047),
                          decoration: InputDecoration(
                            errorText: numbererror
                                ? "Please enter a valid phone number"
                                : null,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff060047)),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Color(0xff060047)),
                            labelText: "Contact Number",
                            counterText: contact ? null : "",
                            // counterText: "",
                            fillColor: Colors.white54,
                            focusColor: Color(0xff060047),
                            filled: true,
                            prefixIcon:
                                Icon(Icons.phone, color: Color(0xff060047)),
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(300, 55),
                                backgroundColor: Color(0xff060047)),
                            onPressed: () {
                              MyDataBase()
                                  .insertpersonaldata(
                                      hname.text,
                                      hcontactnumber.text,
                                      splashpage.db1!,
                                      splashpage.prefe!.getInt("getlid"))
                                  .then((value) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => homepage(),
                                    ));
                              });
                            },
                            child: Text("Save")),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
