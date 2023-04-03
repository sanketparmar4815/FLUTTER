import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: asdf(),
    debugShowCheckedModeBanner: false,
  ));
}
// class asdf extends StatefulWidget {
//   const asdf({Key? key}) : super(key: key);
//
//
//   @override
//   State<asdf> createState() => _asdfState();
// }

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
//             child:Text("${a}",style: TextStyle(fontSize: 100)),
//           ),
//             Container(
// child: ElevatedButton(onPressed: () {
//   setState(() {
//       a = a!+1;
//       prefs!.setInt("qwsa", a!);
//   });
// }, child: Text("increse")),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> prefrence() async {
//     // Obtain shared preferences.
//      prefs = await SharedPreferences.getInstance();
//       setState(() {
//         a =prefs!.getInt("qwsa")??7;
//       });
//   }
// }

class asdf extends StatefulWidget {
  const asdf({Key? key}) : super(key: key);


  @override
  State<asdf> createState() => _asdfState();
}

class _asdfState extends State<asdf> {
  TextEditingController tc = TextEditingController();
  TextEditingController tc1 = TextEditingController();
  // int? a;
   static SharedPreferences? prefs;
   bool asd = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    shareprefrence();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color:
          asd?Colors.red:Colors.green,



          child: Column(children: [
            Container(
              margin: EdgeInsets.all(10),
              
              child: TextField(
                  controller: tc,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'value'),

              ),
            ),
            Container(
                child:
                    ElevatedButton(onPressed: () {
                     setState(() {
                       // int a = prefs!.getInt("zxc")??15;
                       // tc.text="$a";
                       tc.text;
                       print("-------------${tc.text}");
                       prefs!.setInt("zxc", int.parse(tc.text));
                       if(tc.text!=0)
                         {
                           asd = true;

                         }
                     });


                    },
                        child: Text("Set value"))),
            Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: tc1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'value'),
                )),
            Container(
                child:
                    ElevatedButton(onPressed: () {
                      setState(() {
                        tc1.text = tc.text;
                        tc.clear();
                        tc1.text = "${prefs!.getInt("zxc") ?? 5}";
                      });
                    },
                        child: Text("Get value"))),
          ]),
        ),
      ),
    );
  }

  Future<void> shareprefrence() async {
    prefs = await SharedPreferences.getInstance();

    int a = prefs!.getInt("zxc")??5;

  }
}
