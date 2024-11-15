import 'package:flutter/material.dart';
import "demo_poo.dart";
import 'home_page.dart';

void main() {
  runApp(const MyApp(appTitle : "metEOEveil"));
}

class MyApp extends StatelessWidget {

  final String appTitle;
  const MyApp({super.key, required this.appTitle});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true,),
      home: HomePage(title: appTitle),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar (title: Text(title)),
      body: Center(
        child: Image.asset("assets/avatar.jpg"),
      ),
      bottomNavigationBar: Text("Ici c'est le bottom navigation bar"),
    );
  }

}


