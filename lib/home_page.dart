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
  List<String> values = ["poire", "pêche", "cerise", "framboise"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton<String>(
              itemBuilder: (context) {

                return [];

              }
          )
        ],
      ),

      backgroundColor: Colors.lightGreenAccent,

      body: Center()
    );
  }


}