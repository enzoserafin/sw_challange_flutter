import 'package:star_wars_challenge_flutter/imports.dart';
import 'package:star_wars_challenge_flutter/pages/people/character/character_rep.dart';

class CharacterViewModel {

  final planet$ = StreamController();
  CharacterRepository repository = CharacterRepository();

  void fetch(String url) async {
    Planet planet = await repository.getPlanet(url);
    planet$.add(planet);
  }
}