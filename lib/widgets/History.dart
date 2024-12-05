import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState(){
    return _HistoryState();
  }
}

class _HistoryState extends State<History>
{

  IconData _iconData = Icons.person;
  Color _colorButton = Colors.white;

  void _showSnackBar()
  {
    SnackBar snb = SnackBar(
      content: Text("SnackBar"),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      elevation: 5,
      margin: const EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  void _simpleDialog ()
  {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("Changement d'icone !"),
            children: [
              _dialogButton(text: "Home", iconData: Icons.house),
              _dialogButton(text: "Personne", iconData: Icons.person),
            ],
          );
        }
    );
  }

  TextButton _dialogButton({required String text, required iconData})
  {
    return TextButton(
        onPressed: () => {
          setState(() {
            _iconData = iconData;
            Navigator.pop(context);
          })
        },
        child: Row(
          children: [
            Icon(iconData),
            Text(text),
          ],
        )
    );
  }

  TextButton _bottomSheetButton({required String colorStr, required Color color })
  {
    return TextButton(
      onPressed: () => {
        setState(() {
          _colorButton = color;
          Navigator.pop(context);
        })
      },
      child: Text(colorStr),
    );
  }

  Column bottom()
  {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text("Changer la couleur"),
        _bottomSheetButton(colorStr: "Bleu", color: Colors.blue),
        _bottomSheetButton(colorStr: "Red", color: Colors.redAccent),
        _bottomSheetButton(colorStr: "Orange", color: Colors.orange),
        _bottomSheetButton(colorStr: "Violet", color: Colors.deepPurple),
      ],
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: _showSnackBar,
            child: const Text("Elevated Button for SnackBar"),
          ),
          ElevatedButton(
              onPressed: _simpleDialog,
              child: const Text("Elevated Button for Alert Dialog")
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: _colorButton),
            onPressed: ()
            {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: bottom()
                    );
                  }
              );
            },
            child: const Text("Bottom Sheet"),
          ),
          ElevatedButton(
              onPressed: (){Scaffold.of(context).showBottomSheet((BuildContext context) {return bottom();});},
              child: const Text ("Persistante")
          ),
          Icon(_iconData),
        ],
      ),
    );
  }
}