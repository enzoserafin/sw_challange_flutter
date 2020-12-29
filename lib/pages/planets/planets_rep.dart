import 'package:star_wars_challenge_flutter/imports.dart';

class PlanetsRepository {

  Future<Planets> getPlanets(String page) {
    return PlanetsApi.getPlanets(page);
  }
}