import 'package:flutter/material.dart';
import 'package:shayariapp/main.dart';
import 'package:shayariapp/modalclass.dart';
import 'package:shayariapp/second_page.dart';

class firstpage extends StatefulWidget {
  List category;
  List categoryImage;
  int ind;

  firstpage(this.category, this.categoryImage, this.ind);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  List shayri = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.ind == 0) {
      shayri = modal.shubhkamana;
    } else if (widget.ind == 1) {
      shayri = modal.Dosti;
    } else if (widget.ind == 2) {
      shayri = modal.Majedar;
    } else if (widget.ind == 3) {
      shayri = modal.Bhagvan;
    } else if (widget.ind == 4) {
      shayri = modal.Prerana;
    } else if (widget.ind == 5) {
      shayri = modal.Jiavan;
    } else if (widget.ind == 6) {
      shayri = modal.Mohabat;
    } else if (widget.ind == 7) {
      shayri = modal.Yade;
    } else if (widget.ind == 8) {
      shayri = modal.Anay;
    } else if (widget.ind == 9) {
      shayri = modal.Rajniti;
    } else if (widget.ind == 10) {
      shayri = modal.Pram;
    } else if (widget.ind == 11) {
      shayri = modal.Dard;
    } else if (widget.ind == 12) {
      shayri = modal.Sharab;
    } else if (widget.ind == 13) {
      shayri = modal.Bevafa;
    } else if (widget.ind == 14) {
      shayri = modal.Janamdin;
    } else {
      shayri = modal.Holi;
    }
  }

  List emoji =[
    "🥰😄😅😄🤣😙🥰😗🤩"
    ,"☘️🍀🌿🌼🌳🍂👨‍❤‍💋‍👨💑👩‍❤💋‍👨",
    "💐🌹🥀🌺🌷💮🏵️",
    "😀😃😉😗🙃😴😪😘",
    "😒🧐💫⭐😻💓💗💖",
    "😏😌😚😗🥰😍😄😘😄😍😃",
    "🙃🙂😊☺😌😏",
    "😉😗😙😚😘🥰😍🤩🥳",
    "😀😃😄😁😆😅😂🤣😭",
    "😊😂🤣❤😍😒👌😘",
    "😁👍🙌🤦‍♀️🤦‍♂️🤷‍♀️🤷‍♂️",
    "😀 😃 😄 😁 😆 😅 😂 🤣",
    "😍 🥰 😘 😗 😙 😚 😋 😛 😝",
    "🙄 😯 😦 😧 😮 😲",
    "👋 🤚 🖐 ✋ 🖖 👌",
    "☺  😊 😇 🙂 🙃 😉 😌 😍",];



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("${widget.category[widget.ind]}",
            style: TextStyle(fontSize: 24)),
        backgroundColor: Color(0xff61876E),
      ),


      body: Container(
        color: Color(0xffA6BB8D),
        child: ListView.builder(
          itemCount: shayri.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                // decoration: BoxDecoration(color: Color(0xFFF6FBF4)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(index,shayri,widget.category,widget.ind,emoji);
                      },
                    ));
                  },
                  leading: Image(
                      image: AssetImage(

                          "image/${widget.categoryImage[widget.ind]}"),
                    fit: BoxFit.cover,

                  ),
                  title: Text("  ${shayri[index]}", maxLines: 2),
                    // ${emoji[index]}
                    trailing: Icon(Icons.keyboard_arrow_right,
                      color: Color(0xff3C6255), size: 35),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
