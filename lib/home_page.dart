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
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      backgroundColor: isOn ? Colors.lightGreenAccent : Colors.blueGrey,

      body: Center (
        child : Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Valeur du switch :${isOn ? "green" : "blue"}"),
                Switch(
                  value: isOn,
                  onChanged: (newBool){
                    setState(() {isOn = newBool;})
                    ;},
                )
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children : [
                Text("${_current.toInt()} / 6")
              ]
            ),
            Row (
              children : [
                Text (_min.toString()),
                Expanded(
                    child : Slider(
                        divisions: 6,
                        min: _min,
                        max: _max,
                        value: _current,
                        onChanged: (newValue) {
                          setState(() {
                            _current = newValue;
                          });
                        }
                    )
                ),
                Text (_max.toString()),
              ],
            ),
          ],
        )
      )
    );
  }
}

