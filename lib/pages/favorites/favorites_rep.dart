import 'package:star_wars_challenge_flutter/imports.dart';
import 'package:star_wars_challenge_flutter/utils/character_dao.dart';

class FavoritesRepository {
  
  Future<List<Character>> getCharacters() async  {
    final dao = CharacterDAO();
    
    List<Character> list = await dao.findAll();
    
    return list;
    
  }  

  Future<bool> isFavorito(Character c) async {
    final dao = CharacterDAO();

    final exists = await dao.exists(c);

    return exists;
  }

  Future<bool> save(Character c) async {
    final dao = CharacterDAO();
    bool exists = await isFavorito(c);

    if (exists) {
      await dao.delete(c);

      return false;
    } else {
      await dao.save(c);

      return true;
    }
  }

  void delete(Character c) async {
    final dao = CharacterDAO();

    dao.delete(c);
  }
}