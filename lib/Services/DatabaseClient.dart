import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
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
      id INTEGER PRIMARY,
      date TEXT NOT NULL,
      referent_id INTEGER NOT NULL,
      participant_id INTEGER NOT NULL,
      charge_m INTEGER NOT NULL,
      )
    ''');

    await database.execute('''
      CREATE TABLE listParticipants (
      id INTEGER PRIMARY,
      fname TEXT NOT NULL,
      lname TEXT NOT NULL,
      referent_id INTEGER NOT NULL,
      )
    ''');

    await database.execute('''
      CREATE TABLE listReferents (
      id INTEGER PRIMARY,
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
    return mapList.map((map) => Participant.fromMap(map)).toList();
  }
}