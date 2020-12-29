import 'package:star_wars_challenge_flutter/imports.dart';

class PeopleRepository {

  Future<People> getPeople(String page) {
    return PeopleApi.getPeople(page);
  }
}