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

  int _counter = 0;
  Color backgroundColor = Colors.white;
  List<String> _titles = ["bouquet", "joli", "jeune", "paladin","le" , "donne", "un", "a", "la", "donzelle" ];

  int _titleIndex = 0;

  CrossAxisAlignment _alignement = CrossAxisAlignment.center;

  void _onButtonPressed ()
  {
    setState(() {
      _counter++;
    });

  }

  void _longPressTextButton ()
  {
    setState(() {
      backgroundColor = (backgroundColor == Colors.white) ? Colors.deepOrangeAccent : Colors.white;

    });
  }

  void _modifyTitle ()
  {
    setState(() {
      _counter++;
      _titleIndex = Random().nextInt(_titles.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_titleIndex]),
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child : Center(
          child : Column(
            crossAxisAlignment: _alignement,
            children: [
              Text(
                  "$_counter",
                  style:TextStyle(
                    fontSize: 200,
                    color: Colors.cyan,
                  )
              ),
              TextButton(
                  onPressed: ()
                  {
                    _counter = 0;
                    setState(() {
                      backgroundColor = (backgroundColor == Colors.white) ? Colors.black54 : Colors.white;
                    });
                  },
                  onLongPress: _longPressTextButton,
                  child: const Text("TextButton")
              ),
              ElevatedButton(
                  onPressed: _modifyTitle,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreenAccent),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,

                    children : [
                      Icon(Icons.edit),
                      Text("Changer le titre")
                    ],
                  ),
              ),
              FilledButton(
                  onPressed: (){
                    setState(() {
                      _alignement = CrossAxisAlignment.start;
                    });
                  },
                  child: const Text("Change position"))
            ],
          )
        )


      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _onButtonPressed,
          child: const Icon(Icons.add),
      ),
      
    );
  }


}