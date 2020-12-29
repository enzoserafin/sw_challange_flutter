import 'package:star_wars_challenge_flutter/imports.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CharacterApi {
  static Future<Planet> getPlanet(String url) async {
    print("GET $url");

    var response = await http.get(url);

    Map data = convert.json.decode(response.body);
    print("Data >>>> $data");

    return Planet.fromMap(data);
  }
}