import "dart:math";

import "package:flutter/material.dart";
import "package:tuto/Services/DatabaseClient.dart";
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

  List<Participant> participants = [];

  @override
  void initState() {
    // TODO: implement initState
    getParticipantList();
    print("LISTE DES PARTICIPANTS = ${participants}");
    super.initState();
  }

  @override
  void dispose () {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Nouveau Formulaire : ${participants.length} participants."),
        //  Expanded(
       //     child: ListView.separated(
       //       itemBuilder: (context, index) {
         //       final participant = participants[index];
       //         return ParticipantListTile(
        //          participant: participant,
        //          onPressed: onListPressed(participant),
        //          onDelete: onDeleteParticipant(participant),
        //        );
        //      },
        //      separatorBuilder: (context, index) => const Divider(),
        //      itemCount: participants.length,
        //    ),
        //  ),
          CustomAppBar(title_str: "Ajouter un participant", buttonTitle: "+", callback: addParticipant)
        ],
      ),
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