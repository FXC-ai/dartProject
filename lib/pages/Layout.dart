import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto/widgets/Formulaire.dart';
import 'package:tuto/widgets/Home.dart';
import 'package:tuto/widgets/Questions.dart';

import '../model/tabs.dart';
import '../widgets/History.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<StatefulWidget> createState ()
  {
    return LayoutState();
  }
}

class LayoutState extends State<Layout>
{

  int _index = 0;

  final List<Tabs> _tabs = [
    Tabs(name: "Home", iconData: Icons.home, widget: const Home()),
    Tabs(name: "Historique",
        iconData: Icons.history,
        widget: const History()),
    Tabs(name: "Questionnaire",
        iconData: Icons.question_mark,
        widget: const Questions(
            title: "Suivi charge mental au travail", name: "Référent mesure")),
    Tabs(name: "Formulaire", iconData: Icons.question_answer, widget: const Formulaire(title: "Evaluation charge mental par participant", name: "Pour moi")),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Met EOE veiL"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: const Text("Menu")),
            Column(
              children: _tabs.map((t)  {return TextButton(
                  onPressed: (){
                    setState(() {
                      Navigator.pop(context);
                      _index = _tabs.indexOf(t);
                    });
                  },
                  child: Text(t.name));}).toList(),
            )

          ],
        )
      ),
      body: _tabs[_index].widget,
    );
  }
}


