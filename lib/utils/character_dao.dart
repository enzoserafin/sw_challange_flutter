import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:star_wars_challenge_flutter/imports.dart';
import 'package:star_wars_challenge_flutter/utils/db_helper.dart';

class CharacterDAO {
  Future<Database> get db => DatabaseHelper.getInstance().db;

  Future<int> save(Character character) async {
    var dbClient = await db;
    var name = await dbClient.insert("character", character.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    print('name: $name');
    return name;
  }

  Future<List<Character>> findAll() async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from character');

    final character = list.map<Character>((json) => Character.fromMapSql(json)).toList();

    return character;
  }

  Future<Character> findById(String name) async {
    var dbClient = await db;

    final list = await dbClient.rawQuery('select * from character where name = ?', [name]);

    if (list.length > 0) {
      return Character.fromMapSql(list.first);
    }
    return null;
  }

  Future<bool> exists(Character character) async {
    Character c = await findById(character.name);
    var exists = c != null;
    return exists;
  }

  Future<int> delete(Character character) async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from character where name = ?', [character.name]);
  }
}
