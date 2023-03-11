import 'package:flutter/material.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   title: Container(
        //     height: 50,
        //     child: TextField(
        //         style: TextStyle(color: Colors.grey),
        //         decoration: InputDecoration(
        //           fillColor: Colors.black12,
        //           filled: true,
        //           border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(25)),
        //           label: Text("Search your notes"),
        //         )),
        //   ),
        // ),
        body: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
