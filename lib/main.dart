import 'package:flutter/material.dart';
import 'package:tuto/history_page.dart';
import "demo_poo.dart";
import 'home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      title: 'met EOE veil',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal ), useMaterial3: true,),
      home: const HistoryPage(),
      // home: HomePage(title: appTitle),
    );
  }
}







