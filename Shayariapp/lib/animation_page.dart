import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:shayariapp/second_page.dart';

// void main() {
//   runApp(MaterialApp(
//     home: animation_page(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

class animation_page extends StatefulWidget {
  int lenth;

  animation_page(this.lenth);

  @override
  State<animation_page> createState() => _animation_pageState();
}

class _animation_pageState extends State<animation_page> {
  List Gcolor = [
    Colors.pink,
    Colors.greenAccent,
    Colors.orange,
    Colors.black,
    Colors.pink,

  ];
   List<LinearGradient> lg  =
   [LinearGradient(colors: GradientColors.pink),
     LinearGradient(colors: GradientColors.amyCrisp),
     LinearGradient(colors: GradientColors.warmFlame),
     LinearGradient(colors: GradientColors.nightFade),
     LinearGradient(colors: GradientColors.sunnyMorning),
     LinearGradient(colors: GradientColors.dustyGrass),
     LinearGradient(colors: GradientColors.morpheusDen),
     LinearGradient(colors: GradientColors.itmeoBranding),
     LinearGradient(colors: GradientColors.redSalvation),
     LinearGradient(colors: GradientColors.nightParty),
     LinearGradient(colors: GradientColors.phoenixStart),
     LinearGradient(colors: GradientColors.eternalConstance),
     LinearGradient(colors: GradientColors.strongStick),
     LinearGradient(colors: GradientColors.leCocktail),
     LinearGradient(colors: GradientColors.riverCity),
     LinearGradient(colors: GradientColors.plumBath),
     LinearGradient(colors: GradientColors.colorfulPeach),
     LinearGradient(colors: GradientColors.marbleWall),
     LinearGradient(colors: GradientColors.happyMemories),
     LinearGradient(colors: GradientColors.blackGray),
     LinearGradient(colors: GradientColors.desertHump),
     LinearGradient(colors: GradientColors.skyGlider),
     LinearGradient(colors: GradientColors.blessingGet),
     LinearGradient(colors: GradientColors.meanFruit),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Love Shayari", style: TextStyle(fontSize: 24)),
        backgroundColor: Color(0xff61876E),
        actions: [],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: lg.length,
        itemBuilder: (context, index) {
          return InkWell(
            // onTap: () {
            //   setState(() {
            //     print("----------Gradiant color tap on-------");
            //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            //       return secondpage(lg[index]);
            //     },));
            //
            //   });
            // },
            child: Container(


              height: 100,
              width: 100,
             decoration: BoxDecoration(gradient: lg[index],),

              margin: EdgeInsets.all(15),

            ),
          );
        },
      ),
    );
  }
}
