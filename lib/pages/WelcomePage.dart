import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto/pages/history_page.dart';
import 'package:tuto/widgets/QuestionPage.dart';

import '../widgets/body.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  final List<Widget> _bodies = const [
    Body(),
    HistoryPage(),
    QuestionPage(title: "Suivi charge de travail", name: "Claude")
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Welcome"),
              bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.home), text: "Home"),
                    Tab(icon: Icon(Icons.history), text: "Historique"),
                    Tab(icon: Icon(Icons.question_mark), text: "Questionnaire"),
                  ]),
            ),
            body: TabBarView(
                children: _bodies),
        ));
  }
}