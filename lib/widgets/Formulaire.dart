import "dart:math";

import "package:flutter/material.dart";
import "package:tuto/Services/DatabaseClient.dart";
import "package:tuto/model/answersQuestions.dart";
import "package:tuto/model/participant.dart";
import "package:tuto/widgets/ParticipantListTile.dart";
import "package:tuto/widgets/customAppBar.dart";

import "AddDialog.dart";

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

  final _formKey = GlobalKey<FormState>();
  List<Participant> participants = [];
  List<AnswerQuestion> answers = [];
  double _valueQ = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    getAnswersList();
    print("LISTE DES REPONSES = ${answers.length}\n");
    super.initState();
  }

  @override
  void dispose () {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
        Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("Albert II de Monaco"),
              Slider(
                value: _valueQ,
                onChanged: (newValue) => {
                    setState(() {_valueQ = newValue;
                  })},
                min: 0,
                max: 5,
                divisions: 5,
              ),
              ElevatedButton(
                onPressed: (() { DatabaseClient().addAnswerQuestion(_valueQ.toInt()).then((ok) => getAnswersList());} ),
                child: const Text("Valider")
              ),
            ]
          )
        ),

        Text("Nombre de réponse = ${answers.length}"),
        Expanded(
          child: ListView.separated(
              itemBuilder: ((context, index) {
                final answ = answers[index];
                return Text("${answ.referent_id} | ${answ.date} | ${answ.charge_m}");
              }

              ),
              separatorBuilder: ((context, index) => const Divider()),
              itemCount: answers.length
            ),
          )
        ],
      );
    }

  getParticipantList () async {
    final fromDb = await DatabaseClient().allParticipants();
    setState(() {
      participants = fromDb;
    });
  }

  addParticipant () async {
    await showDialog(context : context, builder : (context) {
      final controller = TextEditingController();
      return AddDialog(
        controller: controller,
        onAdded : (() {
          handleCloseDialog();
          if (controller.text.isEmpty) return;
          DatabaseClient().addParticipant(controller.text).then((sucess) => getParticipantList());

        }),
        onCancel: handleCloseDialog,
      );
    });
  }

  getAnswersList () async {
    final fromDb = await DatabaseClient().allAnswers();
    setState(() {
      answers = fromDb;
    });
  }

  handleCloseDialog() {
    Navigator.pop(context);
    FocusScope.of(context).requestFocus(FocusNode());
  }

  onListPressed(Participant)
  {

  }

  onDeleteParticipant(Participant)
  {

  }

}