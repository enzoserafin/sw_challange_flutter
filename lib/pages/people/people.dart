import 'package:star_wars_challenge_flutter/pages/people/character/character.dart';

class People {
  int count;
  String next;
  String previous;
  List<Character> results;

  People({this.count, this.next, this.previous, this.results});

  People.fromMap(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<Character>();
      json['results'].forEach((v) {
        results.add(new Character.fromMap(v));
      });
    }
  }

  static List<People> fromList(List list) {
    return list
        .map<People>((map) => People.fromMap(map))
        .toList();
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toMap()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'People{count: $count, next: $next, previous: $previous, results: $results}';
  }
}

