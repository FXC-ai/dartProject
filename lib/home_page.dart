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
  String _simple = "";
  String _afterSubmit = "";

  final FocusNode _focus = FocusNode(); // cette fonction sert à mettre le focus sur un node
  final FocusNode _next = FocusNode();

  void unfocus (FocusNode focusNode)
  {
    focusNode.unfocus();
  }

  //@override
  //void initState()
  //{
  //  super.initState();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),

      backgroundColor: Colors.lightGreenAccent,

      body: InkWell(

        onTap: () {
          unfocus(_focus); // chaque fois que je clique sur le body cela enleve le focus
        },
        child: Center(
          child: Column (
            children: [
              Text("Text field simple : $_simple"),
              Text("After submit : $_afterSubmit"),
              Row(
                children: [
                  Expanded(
                    child:

                    TextField(
                      focusNode: _focus,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: (newStr)
                      {
                        setState(() {
                          _simple = newStr;
                        });
                      },
                      onSubmitted: (newStr)
                      {
                        setState(() {
                          _afterSubmit = newStr;
                        });
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: (){FocusScope.of(context).requestFocus(_next);},
                      icon: const Icon(Icons.icecream)
                  )
                ],
              ),
                    const SizedBox(height: 24),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child : TextField(
                            focusNode: _next,
                            decoration: InputDecoration(
                              border : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(42),
                              )
                            ),
                        ),
                    ),
            ],
          ),
        ),
      )
    );
  }
}

