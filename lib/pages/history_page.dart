import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto/widgets/QuestionPage.dart';

import '../widgets/body.dart';

class HistoryPage extends StatelessWidget
{
  const HistoryPage ({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: const Body(),
    );
    throw UnimplementedError();
  }

}