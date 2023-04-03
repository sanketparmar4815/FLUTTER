import 'package:flutter/material.dart';

class Imagepick extends StatefulWidget {
  const Imagepick({Key? key}) : super(key: key);

  @override
  State<Imagepick> createState() => _ImagepickState();
}

class _ImagepickState extends State<Imagepick> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://picsum.photos/250?image=9',),
              ),
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
