import "dart:math";

import "package:flutter/material.dart";

class HomePage extends StatefulWidget
{
  final String title; // Attribut


  const HomePage ({super.key, required this.title}); // Constructeur

  @override
  State<HomePage> createState ()
  {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
{
  bool isOn = true;
  double _min = 0;
  double _max = 6;
  double _current = 3;


  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.blue,
      appBar: AppBar(
          title: Text(widget.title)
      ),
      body: SingleChildScrollView (
        scrollDirection: Axis.vertical,
        child : Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row (
                children: List.generate(16, (idx) => CircleAvatar(
                    child : Text(idx.toString())
                  )
                ),
              )
            ),
            Container(
              color: Colors.green,
              height: 54,
            ),
            Container(
              color: Colors.orange,
              height: 540,
            ),
            Container(
              color: Colors.yellow,
              height: 54,
            ),
            Container(
              color: Colors.greenAccent,
              height: 54,
            ),
            Container(
              color: Colors.redAccent,
              height: 54,
            ),
            Container(
              color: Colors.brown,
              height: 128,
            ),
          ],

        )
      )
    );
  }
}

