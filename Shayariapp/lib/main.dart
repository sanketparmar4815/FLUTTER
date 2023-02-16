import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayariapp/first_page.dart';

void main() {
  runApp(MaterialApp(
    home: shayariapp(),
    debugShowCheckedModeBanner: false,
  ));
}


class shayariapp extends StatefulWidget {
  static List ll = [];

  shayariapp({Key? key}) : super(key: key);

  @override
  State<shayariapp> createState() => _shayariappState();
}



class _shayariappState extends State<shayariapp> {
  List category = [
    "Shubhkamna shyari",
    "Dosti shayari",
    "Majedar shayari",
    "Bhagvan shayari",
    "Prerana strot shayari",
    "Jiavan shayari",
    "Mohabat shayari",
    "Yade shayari",
    "Anay shayari",
    "Rajniti shayari",
    "Pram shayari",
    "Dard shayari",
    "Sharab shayari",
    "Bevafa shayari",
    "Janamdin shayari",
    "Holi shayari"
  ];
  List categoryImage = [
    "img1.jpg",
    "img2.jpg",
    "img3.jpg",
    "img4.jpg",
    "img5.jpg",
    "img6.jpg",
    "img7.jpg",
    "img8.jpg",
    "img9.jpg",
    "img10.jpg",
    "img11.jpg",
    "img12.jpg",
    "img13.jpg",
    "img14.jpg",
    "img15.jpg",
    "img16.jpg"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

forpermission();
  }
  Future<void> forpermission()
  async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await [

        Permission.storage,
      ].request();

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Love Shayari", style: TextStyle(fontSize: 24)),
          backgroundColor: Color(0xff61876E),
          actions: [
            Container(child: Icon(Icons.share), margin: EdgeInsets.all(10)),
            Container(
                margin: EdgeInsets.only(right: 15),
                child: Icon(Icons.more_vert)),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Color(0xFFFA6BB8D)),
          child: ListView.builder(
            itemCount: category.length,
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                  elevation: 20,
                  margin: EdgeInsets.all(5),
                  // decoration: BoxDecoration(color: Color(0xFFF6FBF4)),
                  child: ListTile(
                    // hoverColor: Colors.yellow,
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return firstpage(category, categoryImage, index);
                        },
                      ));
                    },
                    leading: Image(
                        image: AssetImage("image/${categoryImage[index]}"),
                        fit: BoxFit.cover,
                        height: 45,
                        width: 50),
                    // leading: CircleAvatar(radius: 10,
                    //     backgroundImage: AssetImage("image/${categoryImage[index]}"),
                    //     ),
                    title: Text(
                      "${category[index]}",
                      style: TextStyle(
                          color: Color(0xFF3C6255),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
// 3C6255
// 61876E
// A6BB8D
// EAE7B1
