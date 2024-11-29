import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto/pages/history_page.dart';
import 'package:tuto/pages/home_page.dart';

class WelcomePage extends StatelessWidget
{
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
        child :
            Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Entrez votre nom",
                    border: OutlineInputBorder()
                  ),
                  onSubmitted: (name){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {

                      return HomePage(title: name, name: name);


                    }));
                    
                    
                  },
                ),
                TextButton(
                    onPressed: ()
                    {
                      MaterialPageRoute route = MaterialPageRoute(builder: (BuildContext context) {return const HistoryPage();});
                      Navigator.of(context).push(route);

                    },
                    child: Text("Historique")
                ),
                TextButton(
                    onPressed: ()
                    {
                      MaterialPageRoute route = MaterialPageRoute(builder: (BuildContext context) {return const HomePage(title: "Questionnaire", name: "FX");});
                      Navigator.of(context).push(route);

                    },
                    child: Text("Questionnaire")
                )
              ],
            )
      )
    );

  }
}