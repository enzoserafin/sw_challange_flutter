import 'package:star_wars_challenge_flutter/imports.dart';

class CharacterRepository {

  Future<Planet> getPlanet(String url) {
    return CharacterApi.getPlanet(url);
  }
}