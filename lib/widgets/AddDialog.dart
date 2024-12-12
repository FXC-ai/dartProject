
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onCancel;
  VoidCallback onAdded;

  AddDialog({required this.controller, required this.onAdded, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ajouter un partcipant"),
      content : TextField(
      controller: controller,
      ),
      actions : [
        TextButton(
            onPressed: onAdded, 
            child: Text("Valider")),
        TextButton(
            onPressed: onCancel,
            child: Text("Annuler"))
      ]

    );
  }

}