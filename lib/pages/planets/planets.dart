

import 'package:star_wars_challenge_flutter/imports.dart';

class Planets {
  int count;
  String next;
  String previous;
  List<Planet> results;

  Planets({this.count, this.next, this.previous, this.results});

  Planets.fromMap(Map<String, dynamic> map) {
    count = map['count'];
    next = map['next'];
    previous = map['previous'];
    if (map['results'] != null) {
      results = new List<Planet>();
      map['results'].forEach((v) {
        results.add(new Planet.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['count'] = this.count;
    map['next'] = this.next;
    map['previous'] = this.previous;
    if (this.results != null) {
      map['results'] = this.results.map((v) => v.toMap()).toList();
    }
    return map;
  }
}