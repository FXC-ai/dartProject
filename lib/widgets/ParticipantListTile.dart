import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/participant.dart';

class ParticipantListTile extends StatelessWidget {
  Participant participant;
  Function(Participant) onPressed;
  Function(Participant) onDelete;

  ParticipantListTile(
      {required this.participant, required this.onPressed, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(participant.fname),
      onTap: (() => onPressed(participant)),
      trailing: IconButton(
          onPressed: (() => onDelete(participant)),
          icon: const Icon(Icons.delete)),
    );
  }
}

