import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/03.png"), fit: BoxFit.contain),

          // child: Stack(children: [Container(
          //   height: double.infinity,
          //   width: double.infinity,
            // color: Color(0xffDDDDDD),

           ),
          // ],

          // ),
        ),
      ),
    );
  }
}
