import 'package:flutter/material.dart';
import 'package:practical/display.dart';

class homepageone extends StatefulWidget {
  const homepageone({Key? key}) : super(key: key);

  @override
  State<homepageone> createState() => _homepageoneState();
}

class _homepageoneState extends State<homepageone> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Alert"),
                  content: Text("Are you sure you want to exit?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: Text("NO"),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            // exit(0);
                          });
                          // Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return diaplayq();
                            },
                          ));
                        },
                        child: Text("YES")),
                  ],
                ));
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
