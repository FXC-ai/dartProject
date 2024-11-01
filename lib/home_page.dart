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

  double _min_nuit_h = 0;
  double _max_nuit_h = 14;
  double _current_nuit_h = 7;

  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(text : "A noter que...");
  }

  @override
  void dispose () {
    _controller.dispose();
    super.dispose();
  }

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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Comment allez-vous ?",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Slider(
                      value: _current,
                      onChanged: (newValue) => {
                        setState(() {_current = newValue;
                        })},
                      min: _min,
                      max: _max,
                      divisions: 6,
                    )
                ),
                Text("${_current.toInt()} / ${_max.toInt()}")
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                          "Combien d'heures avez-vous dormi cette nuit ?",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                ),
              ],
            ),
            Row (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Slider(
                      value: _current_nuit_h,
                      onChanged: (newValue) => {
                        setState(() {_current_nuit_h = newValue;
                        })},
                      min: _min_nuit_h,
                      max: _max_nuit_h,
                      divisions: 28,
                    )
                ),
                Text("${_current_nuit_h.toStringAsFixed(1)} / ${_max_nuit_h.toInt()}")
              ],
            ),
            Row (
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child:
                  TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                          label: Text(_controller.text),
                      ),
                    ),
                  )
                ]
            )
          ],
        )
      )
    );
  }
}

