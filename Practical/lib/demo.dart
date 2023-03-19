import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class share extends StatefulWidget {
  const share({Key? key}) : super(key: key);

  @override
  State<share> createState() => _shareState();
}

class _shareState extends State<share> {
  String folderpath="";
  WidgetsToImageController con = WidgetsToImageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forpermission();
    createFolder();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          WidgetsToImage(
            controller: con,

            child: Container(
                margin: EdgeInsets.fromLTRB(30, 200, 100, 0),

                height: 300,
                width: 300,
                color: Colors.blueGrey,
                child: Center(child: Text("asdfg", style: TextStyle(color: Colors.black,fontSize: 30, fontWeight: FontWeight.bold, ),))),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 40, 100, 0),
            child: IconButton(onPressed: () {
              con.capture().then((value) async {
                DateTime dt=DateTime.now();
                String ss="image${dt.day}${dt.month}${dt.year}${dt.millisecond}.png";
                String sss="${folderpath}/${ss}";
                File file=File(sss);
                List<int> bytearray= value as List<int>;
                await file.writeAsBytes(value!);
                file.create();
                Share.shareFiles(['${file.path}'], text: 'Great picture');




              });


            }, icon: Icon(Icons.share, size: 40,color:Colors.black,)),
          )
        ],
      ),
    );
  }






  Future<void> forpermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {

      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,

      ].request();

    }
  }
  Future<void> createFolder() async {
    final folderName = "image";
    final path1 = Directory("storage/emulated/0/DCIM/$folderName");

    if ((await path1.exists())) {

    } else {
      path1.create();

    }
    setState(() {
      folderpath=path1.path;
    });
  }

}