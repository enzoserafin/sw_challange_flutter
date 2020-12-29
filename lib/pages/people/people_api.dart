import 'package:star_wars_challenge_flutter/imports.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PeopleApi {
  static Future<People> getPeople(String page) async {
    var url = "https://swapi.dev/api/people/?page=$page";
    print("GET $url");

    var response = await http.get(url);

    Map data = convert.json.decode(response.body);
    print("Data >>>> $data");

    return People.fromMap(data);
  }
}
