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

  final List<Animal> _animaux = [
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
              return values.map((ani) {return PopupMenuItem<String>(
                  value : ani,
                  child: Text(ani));}
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
              segments: _animaux.map((animal){
                return ButtonSegment<Animal>(value: animal, label: Text(animal.name));
              }).toList(),
              selected: _selection,
              onSelectionChanged: (newSet){
                setState(() {
                  _selection = newSet;
                });
              },
            ),
            Text("animal : ${_selection.first.name}")
          ]
        ),
      )
    );
  }
}

class Animal {
  String name;
  String icon;

  Animal(this.name, this.icon);

}