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

  YesNo? _yesOrNo;

  final _formKey = GlobalKey<FormState>();

  static double _scale_min = 0;
  static double _scale_max = 5;


  bool isOn = true;

  double _currentQ0 = 3;
  double _currentQ1 = 3;
  double _currentQ2 = 3;
  double _currentQ3 = 3;
  double _currentQ4 = 3;
  double _currentQ5 = 3;


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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded (child: Form(
                    key: _formKey,
                    child: Column (
                      children: [
                        const Text(
                          "Ces dernieres 24 heures ...",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        const Text(
                          "Quel a été ton niveau de stress ?",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Slider(
                          value: _currentQ0,
                          onChanged: (newValue) => {
                            setState(() {_currentQ0 = newValue;
                            })},
                          min: _scale_min,
                          max: _scale_max,
                          divisions: 5,
                        ),
                        Text("${_currentQ0.toInt()} / ${_scale_max.toInt()}"),
                        const Text(
                          "Quel a été ton niveau d'energie global ?",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Slider(
                        value: _currentQ1,
                        onChanged: (newValue) => {
                          setState(() {_currentQ1 = newValue;
                          })},
                        min: _scale_min,
                        max: _scale_max,
                        divisions: 5,),
                        Text("${_currentQ1.toInt()} / ${_scale_max.toInt()}"),
                        const Text(
                          "As tu ressenti du plaisir, de la satisfaction ?",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Slider(
                          value: _currentQ2,
                          onChanged: (newValue) => {
                            setState(() {_currentQ2 = newValue;
                            })},
                          min: _scale_min,
                          max: _scale_max,
                          divisions: 5,),
                        Text("${_currentQ2.toInt()} / ${_scale_max.toInt()}"),

                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child : Text(
                            "A quel point te sens-tu connecté(e) aux autres aujourd'hui ?",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),

                        Slider(
                          value: _currentQ3,
                          onChanged: (newValue) => {
                            setState(() {_currentQ3 = newValue;
                            })},
                          min: _scale_min,
                          max: _scale_max,
                          divisions: 5,),
                        Text("${_currentQ3.toInt()} / ${_scale_max.toInt()}"),



                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child : Text(
                            "Avez-vous ressenti une anxiété qui vous a empêché de faire des choses ?",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),

                        Row(
                          children: YesNo.values.map((choice){
                            return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row (
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    Radio(
                                      value: choice,
                                      groupValue: _yesOrNo,
                                      onChanged: (newChoice) {setState(() {
                                        _yesOrNo = newChoice;
                                      });},
                                    ),
                                    Text(choice.name)
                                  ],
                                )
                            );
                          }).toList(),
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child : Text(
                            "Y a-t-il quelque chose de particulier dont tu aimerais parler ou que tu as sur le cœur aujourd'hui ?",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),


                        Container(
                          margin: EdgeInsets.all(16.0),
                          height: 128,
                          child: Column(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller : _controller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter some value";
                                    }
                                    else
                                    {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'Facultatif...',
                                      border: OutlineInputBorder(),

                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  expands: true, // <-- SEE HERE
                                ),
                              ),

                            ],
                          ),
                        ),



                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate())
                            {

                              showDialog(
                                  context: context,
                                  builder: (context) {return AlertDialog(content: Text(_currentQ1.toString()));}
                              );
                            }
                            else {
                              print("dfsfg");
                            }
                          },
                          child: const Text("Valider"),
                        )
                      ],
                    )
                ),
                )
              ],

            )
          ],
        )
      )
    );
  }
}

enum YesNo
{
  oui,
  non
}

