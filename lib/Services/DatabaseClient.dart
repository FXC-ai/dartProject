import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tuto/model/answersQuestions.dart';
import 'package:tuto/model/participant.dart';

class DatabaseClient {

  //2 Tables
  //Table 1 => Liste de mes envies. Ex: Liste informatique, liste de noel (Nom et un Identifiant)
  //Table 2 => Liste des objects. Un ps5, un nouveau clavier. (Nom, prix, magasin, image, l'id de la liste, leur propre id)
  //INTEGER, TEXT, REAL
  //INTEGER PRIMARY KEY pour id unique
  // TEXT NOT NULL

  //Accéder à la Database
  Database? _database;

  Future<Database> get database async {
    if (_database != null)
      {
        print("pbpbpbpbp");
        return _database!;
      }

    return await createDatabase();
  }

  Future<Database> createDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'database.db');
    print("PATH = {$path}");
    return await openDatabase(
        path,
        version: 1,
        onCreate: onCreate
    );
  }

  onCreate (Database database, int version) async {
    await database.execute('''
      CREATE TABLE answersQuestions (
      id INTEGER PRIMARY KEY,
      date TEXT NOT NULL,
      referent_id INTEGER NOT NULL,
      participant_id INTEGER NOT NULL,
      charge_m INTEGER NOT NULL
      )
      ''');

    await database.execute('''
      CREATE TABLE listParticipants (
      id INTEGER PRIMARY KEY,
      fname TEXT NOT NULL,
      lname TEXT NOT NULL,
      referent_id INTEGER NOT NULL
      )
    ''');

    await database.execute('''
      CREATE TABLE listReferents (
      id INTEGER PRIMARY KEY,
      fname TEXT NOT NULL,
      lname TEXT NOT NULL,
      login TEXT NOT NULL,
      password TEXT NOT NULL
      )
    ''');
  }

  Future<List<Participant>> allParticipants() async
  {
    Database db = await database;
    const query = 'SELECT * FROM listParticipants';
    List<Map<String, dynamic>> mapList = await db.rawQuery(query);
    print("ALL PARTICIPANTS = ${mapList.map((map) => Participant.fromMap(map)).toList()[1].lname}");
    return mapList.map((map) => Participant.fromMap(map)).toList();
  }

  Future<bool> addParticipant (String fname) async {
    Database db = await database;
    await db.insert('listParticipants', {"fname" : fname, "lname" : "test", "referent_id" : 42});
    return true;
  }

  Future<List<AnswerQuestion>> allAnswers() async
  {
    Database db = await database;
    const query = 'SELECT * FROM answersQuestions';
    List<Map<String, dynamic>> mapList = await db.rawQuery(query);
    List<AnswerQuestion> result = mapList.map((map) => AnswerQuestion.fromMap(map)).toList();
    print("ALL ANSWERS = ${result.length}");
    return result;
  }

  Future<bool> addAnswerQuestion (int charge) async
  {
    Database db = await database;
    await db.insert('AnswersQuestions', {"date" : "13122024", "referent_id" : 1, "participant_id" : 42, "charge_m" : charge});
    return true;
  }


}