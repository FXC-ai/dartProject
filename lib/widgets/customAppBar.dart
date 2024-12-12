

import 'package:flutter/material.dart';

class CustomAppBar extends AppBar{
  String title_str;
  String buttonTitle;
  VoidCallback callback;

  CustomAppBar({required this.title_str,
                required this.buttonTitle,
                required this.callback}):
      super(
        title: Text(title_str),
        actions: [
          TextButton(
          onPressed: callback,
          child: Text(buttonTitle, style : const TextStyle(color: Colors.brown))
      )
        ]
      );
}