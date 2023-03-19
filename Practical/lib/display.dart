import 'package:flutter/material.dart';
import 'package:practical/setsecond.dart';
import 'package:practical/splashscreen.dart';

class diaplayq extends StatefulWidget {
  const diaplayq({Key? key}) : super(key: key);

  @override
  State<diaplayq> createState() => _diaplayqState();
}

class _diaplayqState extends State<diaplayq> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return splashscreen();

                  },));

                });

              }, child: Text("First practical")),
              ElevatedButton(onPressed: () {
                setState(() {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return practical2();
                 },));
                });

              }, child: Text("Second practical"))
            ],
          ),
        ),
      ),
    );
  }
}
