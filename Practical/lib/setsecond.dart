import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class practical2 extends StatefulWidget {
  const practical2({Key? key}) : super(key: key);

  @override
  State<practical2> createState() => _practical2State();
}

class _practical2State extends State<practical2> {
  String folderpath = "";

  WidgetsToImageController wtoi = WidgetsToImageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forgetpermision();
    forceareatefoler();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            WidgetsToImage(
              controller: wtoi,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 250,
                  width: 250,
                  child: Center(child: Text("My name is sanket Parmar!")),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2), color: Colors.grey),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              wtoi.capture().then((value) async {
                DateTime dt=DateTime.now();
                String ss="image${dt.day}${dt.month}${dt.year}${dt.millisecond}.png";
                String sss="${folderpath}/${ss}";
                File file=File(sss);
                List<int> bytearray= value as List<int>;
                await file.writeAsBytes(value!);
                file.create();
                Share.shareFiles(['${file.path}'], text: '');


              });
            }, child: Text("Share"))
          ],
        ),
      ),
    );
  }

  Future<void> forgetpermision() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.camera,
      ].request();
      print(statuses[Permission.storage]);
    }
  }

  Future<void> forceareatefoler() async {
    final folderName = "image";
    final path1 = Directory("storage/emulated/0/DCIM/$folderName");

    if ((await path1.exists())) {
    } else {
      path1.create();
    }
    setState(() {
      folderpath = path1.path;
    });
  }
}
