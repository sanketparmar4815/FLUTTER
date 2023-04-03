import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practical/database.dart';
import 'package:practical/signin.dart';

class quetion123 extends StatefulWidget {
  @override
  State<quetion123> createState() => _quetion123State();
}

class _quetion123State extends State<quetion123> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateInput.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Center(child: Text("Sign up ")),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              height: 100,
              width: 350,
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    labelText: "Name", border: OutlineInputBorder()),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              height: 100,
              width: 350,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    labelText: "Email", border: OutlineInputBorder()),
              ),
            ),
          ),
          Container(
            width: 350,
            child: Center(
              child: TextField(
                controller: dateInput,
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today), labelText: "Enter Date"),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);
                    setState(() {
                      dateInput.text = formattedDate;
                    });
                  } else {}
                },
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  print("tap on submit");
                  MyDataBase().insertdata(
                      name.text, email.text, dateInput.text, signin.db);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return signin();
                    },
                  ));
                });
              },
              child: Text("Submit"))
        ],
      )),
    );
  }
}
