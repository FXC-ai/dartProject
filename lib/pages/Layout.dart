import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto/widgets/Home.dart';
import 'package:tuto/widgets/Questions.dart';

import '../model/tabs.dart';
import '../widgets/History.dart';

class Layout extends StatelessWidget {
  Layout({super.key});

  final List<Tabs> _tabs = [
    Tabs(name: "Home", iconData: Icons.home, widget: const Home()),
    Tabs(name: "Historique",
        iconData: Icons.history,
        widget: const History()),
    Tabs(name: "Questionnaire",
        iconData: Icons.question_mark,
        widget: const Questions(
            title: "Suivi charge mental au travail", name: "Référent mesure")),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("MetEOEveil"),
            bottom: TabBar(
              indicatorColor: Colors.deepPurpleAccent,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.brown,
              tabs: _tabs.map((t) => t.tab).toList(),
            ),
          ),
          body: TabBarView(
            children: _tabs.map((t) => t.widget).toList(),
          ),
        )
    );
  }
}


