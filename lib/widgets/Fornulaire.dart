import "dart:math";

import "package:flutter/material.dart";
import "package:tuto/Services/DatabaseClient.dart";
import "package:tuto/model/participant.dart";

class Formulaire extends StatefulWidget
{
  final String title; // Attribut
  final String name;


  const Formulaire ({super.key, required this.title, required this.name}); // Constructeur

  @override
  State<Formulaire> createState ()
  {
    return _FormulaireState();
  }
}

class _FormulaireState extends State<Formulaire>
{

  List<Participant> participants = [];

  @override
  void initState() {
    // TODO: implement initState
    getParticipantList();
    super.initState();
  }

  @override
  void dispose () {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Nouveau Formulaire : ${participants.length} participants."),
      ],
    );
  }

  getParticipantList () async {
    final fromDb = await DatabaseClient().allParticipants();
    setState(() {
      participants = fromDb;
    });
  }
}