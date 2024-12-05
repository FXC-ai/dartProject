
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabs {
  String name;
  IconData iconData;
  Widget widget;

  Tab get tab => Tab(icon : Icon(iconData), text : name);


  Tabs({required this.name, required this.iconData, required this.widget});

}