import 'package:star_wars_challenge_flutter/imports.dart';
import 'package:star_wars_challenge_flutter/pages/favorites/favorites_rep.dart';

class FavoritesViewModel {

  FavoritesRepository repository = FavoritesRepository();
  final people$ = StreamController<List<Character>>();

  Future<bool> save(Character c) async {
    return repository.save(c);
  }
  
  void fetch() async {
    List<Character> list = await repository.getCharacters();
    people$.add(list);
  }

  void delete(Character c)  async {
    repository.delete(c);

    fetch();
  }

  void close() {
    people$.close();
  }
}