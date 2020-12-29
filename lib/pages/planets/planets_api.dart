import 'package:star_wars_challenge_flutter/imports.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlanetsApi {
  static Future<Planets> getPlanets(String page) async {
    var url = "https://swapi.dev/api/planets/?page=$page";
    print("GET $url");

    var response = await http.get(url);

    Map data = convert.json.decode(response.body);
    print("Data >>>> $data");

    return Planets.fromMap(data);
  }
}