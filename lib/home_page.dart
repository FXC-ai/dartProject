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
  String _selected = "";

  List<Animal> _animaux = [
    Animal("chat", "cat"),
    Animal("baleine", "whale"),
    Animal("chien", "dog"),
  ];

  late Set<Animal> _selection;

  @override
  void initState()
  {
    super.initState();
    _selection = {_animaux[0]};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton<String>(
            onSelected: (newValue)
              {
                setState(() {
                  _selected = newValue;
                });
              },
            itemBuilder: (context) {
              return values.map((animal) {return PopupMenuItem<String>(
                  value : animal,
                  child: Text(animal));}
              ).toList();
            }
          )
        ],
      ),

      backgroundColor: Colors.lightGreenAccent,

      body: Center(
        child: Column (
          children : [
            Text(_selected),
            SegmentedButton<Animal>(
              segments: [
                ButtonSegment<Animal>(
                    value: _animaux[0],
                    icon: const Icon(Icons.icecream)
                ),
                ButtonSegment(
                    value: _animaux[1],
                    icon: const Icon(Icons.face)
                ),
                ButtonSegment(
                    value: _animaux[2],
                    icon: const Icon(Icons.leaderboard)
                )
              ],
              selected: _selection,
              onSelectionChanged: (newSet){
                setState(() {
                  _selection = newSet;
                });
              },
            ),
          ]
        ),
      )
    );
  }
}

class Animal {
  String name;
  String icon;

  Animal(this.name, this.icon)

}