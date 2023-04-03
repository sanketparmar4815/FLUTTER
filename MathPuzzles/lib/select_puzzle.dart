import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathpuzzles/first_page.dart';
import 'package:mathpuzzles/main.dart';

class puzzle_level extends StatefulWidget {
  int level;

  puzzle_level(this.level);

  @override
  State<puzzle_level> createState() => _puzzle_levelState();
}

class _puzzle_levelState extends State<puzzle_level> {
  List ler = [];
  @override
  void initState() {
    // TODO: implement initState
    ler = List.filled(75, false);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/background.jpg"), fit: BoxFit.fill)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Center(
                    child: Text(" Select  Puzzle ",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue[900]))),
              ),
              Container(
                // height: 500,
                // width: 392.7272727272723,
                height: 775,
                width: double.infinity,

                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: Main_page.sw.length,
                  itemBuilder: (context, index) {
                    if (Main_page.sw[index] == "Success") {
                      return Listener(onPointerDown: (event) {
                        setState(() {
                          ler[index]= true;
                        });

                      },
                        onPointerUp: (event) {
                          setState(() {
                            ler[index]= false;
                          });
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return first_page(index);
                              },
                            ));

                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("image/tick.png")),
                              border: Border.all(color: ler[index]?Colors.black:Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                        ),
                      );
                    } else if (Main_page.sw[index] == "skip") {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return first_page(index);
                            },
                          ));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Center(
                            child: Text("${index + 1}",
                                style: TextStyle(fontSize: 35)),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    } else if (Main_page.sw[index] == "pending") {
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/lock.png"))),
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                      );
                    }
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
