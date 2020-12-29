import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.getInstance();

  DatabaseHelper.getInstance();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await _initDb();

    return _db;
  }

  Future _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'character.db');
    print("db $path");

    var db = await openDatabase(path, version: 1, onCreate: _onCreate /*, onUpgrade: _onUpgrade*/);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE character(name TEXT PRIMARY KEY, height TEXT, mass TEXT, hair_color TEXT, skin_color TEXT, '
            'eye_color TEXT, birth_year TEXT, gender TEXT, homeworld TEXT, films BLOB, species BLOB, vehicles '
            'BLOB, '
            'starships BLOB)');
  }
}
