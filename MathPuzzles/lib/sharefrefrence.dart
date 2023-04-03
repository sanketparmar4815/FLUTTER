import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: Sharefre(),));
}

class Sharefre extends StatefulWidget {
  Sharefre({Key? key}) : super(key: key);

  static SharedPreferences? prefs;

  @override
  State<Sharefre> createState() => _SharefreState();
}


class _SharefreState extends State<Sharefre> {
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    sharedfref();
  }

  @override
  String? a;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(margin: EdgeInsets.all(10),
            child: TextField(
              controller: tc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'value'),
            ),
          ),
          Container(

              child: ElevatedButton(onPressed: () {
                setState(() {
                  print("press on button");
                  int aa = Sharefre.prefs!.getInt("nim")??0;
                  tc.text = "$aa";
                  Sharefre.prefs!.setString("zxc", "asd");
                });

              }, child: Text("Set value"))

          ),
          Container(margin: EdgeInsets.all(10),
              child: TextField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'value'),
              )
          ),
          Container(
            // child: Center(child: Text("Get value"))
              child: ElevatedButton(onPressed: () {
                setState(() {
                  print("press on button");
                });
              }, child: Text("Get value"))
          ),
        ]),
      ),
    );
  }

  Future<void> sharedfref() async {
    Sharefre.prefs = await SharedPreferences.getInstance();
    Sharefre.prefs!.setInt('nim', 10);
    tc.text= Sharefre.prefs!.getString("zxc")??"qwe";

  }
}


// increment code by using sir
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(MaterialApp(home: asdf(),));
// }
// class asdf extends StatefulWidget {
//   const asdf({Key? key}) : super(key: key);
//
//
//   @override
//   State<asdf> createState() => _asdfState();
// }
//
//
// class _asdfState extends State<asdf> {
//
//   SharedPreferences? prefs;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     prefrence();
//   }
//   int? a;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               child:Text("${a}",style: TextStyle(fontSize: 100)),
//             ),
//             Container(
//               child: ElevatedButton(onPressed: () {
//                 setState(() {
//                   a = a!+1;
//                   prefs!.setInt("qwsa", a!);
//                 });
//               }, child: Text("increse")),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> prefrence() async {
//     // Obtain shared preferences.
//     prefs = await SharedPreferences.getInstance();
//     setState(() {
//       a =prefs!.getInt("qwsa")??7;
//     });
//   }
// }
