import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto/Services/DatabaseClient.dart';
import 'package:tuto/model/participant.dart';
import 'package:tuto/widgets/Questions.dart';
import 'History.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState(){
    return _HomeState();
  }
}

class _HomeState extends State<Home>
{
  List<Participant> listPaticipants = [];

  @override
  void initState (){
    super.initState();
  }

  @override
  Widget build (BuildContext context) {
    return const Center(
      child: Text("Ceci est la page d'accueil"),
    );
    throw UnimplementedError();
  }

  getParticipantsList () async {
    final fromDb = await DatabaseClient().allParticipants();
    setState(() {
      listPaticipants = fromDb;
    });
  }
}