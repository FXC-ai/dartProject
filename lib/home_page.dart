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
  late TextEditingController _controller;

  final FocusNode _focus = FocusNode(); // cette fonction sert à mettre le focus sur un node
  final FocusNode _next = FocusNode();
  final FocusNode _forButton = FocusNode();

  final _formKey = GlobalKey<FormState>();

  void unfocus (FocusNode focusNode)
  {
    focusNode.unfocus();
  }

  @override
  void initState()
  {
    super.initState();
    _controller = TextEditingController(text : "Hello World !");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),

      backgroundColor: Colors.lightGreenAccent,

      body: InkWell(
        onTap: () {
          // chaque fois que je clique sur le body cela enleve le focus
          unfocus(_focus);
        },
        child: Center(
          child: Padding (
            padding: const EdgeInsets.all(42),
            child : Column (
              children: [
                Text("Text field simple : $_simple"),
                Text("After submit : $_afterSubmit"),
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
                IconButton (
                    onPressed: (){FocusScope.of(context).requestFocus(_next);},
                    icon: const Icon(Icons.arrow_downward)
                ),
                TextField(
                  focusNode: _next,
                  decoration: InputDecoration(
                    border : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(42),
                    )
                  ),
                ),
                const SizedBox(height: 98),
                TextField(
                  focusNode: _forButton,
                  controller: _controller,
                  decoration: const InputDecoration( border: OutlineInputBorder() ),
                  onSubmitted: (newValue) {
                    setState(() {
                    });
                  },
                ),
                ElevatedButton(
                    onPressed: (() => setState(() {unfocus(_forButton);})),
                    child: const Text("Reveal the text"),
                ),
                Text(_controller.text),
                Form(
                  key: _formKey,
                  child: Column (
                    children: [
                      TextFormField(
                        validator : (value) {
                          if (value == null || value.isEmpty) {
                            return "erreur";
                          }
                          else {
                            null;
                          }
                        },
                      ),
                      TextButton(
                          onPressed: ()
                          {
                            if (_formKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                            } else {
                              print("Nope");
                            };
                          },
                          child: const Text("Valider")
                      )
                    ],
                  )
                )
              ],
            ),
          )
        ),
      )
    );
  }
}

