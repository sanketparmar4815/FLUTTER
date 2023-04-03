import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("hivedemo");
  runApp(MaterialApp(
    home: demohive(),
    debugShowCheckedModeBanner: false,
  ));
}

class demohive extends StatefulWidget {
  const demohive({Key? key}) : super(key: key);

  @override
  State<demohive> createState() => _demohiveState();
}

class _demohiveState extends State<demohive> {
  Map ll = {};

  late Box box;

  @override
  void initState() {
    super.initState();
    demohivec();
  }

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 250,
                    width: 250,
                    color: Colors.yellow,
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 50,
                            width: 250,
                            child: TextField(
                                controller: name,
                                decoration: InputDecoration(
                                    hintText: "name",
                                    border: OutlineInputBorder()),
                                style: TextStyle(color: Colors.purple)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          height: 50,
                          width: 250,
                          child: TextField(
                              controller: number,
                              decoration: InputDecoration(
                                  hintText: "number",
                                  border: OutlineInputBorder()),
                              style: TextStyle(color: Colors.purple)),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              box.put({'name':'sanket',});
                              setState(() {
                                print("tap on submit");
                              });
                            },
                            child: Text("submit")),
                      ],
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.add)),
        body: Container(
          child: Column(
            children: [
              Text("name:"),
              Text("Number:"),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> demohivec() async {
     box = Hive.box("hivedemo");
  }
}
