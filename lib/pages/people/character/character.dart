class Character {
  String name;
  String height;
  String mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  String gender;
  String homeworld;
  List<String> films;
  List<String> species;
  List<String> vehicles;
  List<String> starships;

  Character({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
  });

  get heightMeters => (int.parse(height) / 100);

  List<String> get film {
    List<String> film = [];
    for (var f in films) {
      String s = getFilmName(f);

      film.add(s);
    }
    return film;
  }

  String getFilmName(String url) {
    switch (url) {
      case 'http://swapi.dev/api/films/1/':
        return "Uma nova esperança";
      case 'http://swapi.dev/api/films/2/':
        return "O império contra-ataca";
      case 'http://swapi.dev/api/films/3/':
        return "O retorno de Jedi";
      case 'http://swapi.dev/api/films/4/':
        return "A ameaça fantasma";
      case 'http://swapi.dev/api/films/5/':
        return "O ataque dos clones";
      case 'http://swapi.dev/api/films/6/':
        return "A vingança dos sith";
      default:
        return 'Filme novo!';
    }
  }

  Character.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    height = map['height'];
    mass = map['mass'];
    hairColor = map['hair_color'];
    skinColor = map['skin_color'];
    eyeColor = map['eye_color'];
    birthYear = map['birth_year'];
    gender = map['gender'];
    homeworld = map['homeworld'];
    films = map['films'].cast<String>();
    species = map['species'].cast<String>();
    vehicles = map['vehicles'].cast<String>();
    starships = map['starships'].cast<String>();
  }

  Character.fromMapSql(Map<String, dynamic> map) {
    name = map['name'];
    height = map['height'];
    mass = map['mass'];
    hairColor = map['hair_color'];
    skinColor = map['skin_color'];
    eyeColor = map['eye_color'];
    birthYear = map['birth_year'];
    gender = map['gender'];
    homeworld = map['homeworld'];
    films = map['films'].split(',');
    species = map['species'].split(',');
    vehicles = map['vehicles'].split(',');
    starships = map['starships'].split(',');
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['name'] = this.name;
    map['height'] = this.height;
    map['mass'] = this.mass;
    map['hair_color'] = this.hairColor;
    map['skin_color'] = this.skinColor;
    map['eye_color'] = this.eyeColor;
    map['birth_year'] = this.birthYear;
    map['gender'] = this.gender;
    map['homeworld'] = this.homeworld;
    map['films'] = this.films.join(',');
    map['species'] = this.species.join(',');
    map['vehicles'] = this.vehicles.join(',');
    map['starships'] = this.starships.join(',');
    return map;
  }

  @override
  String toString() {
    return 'Character{name: $name, height: $height, mass: $mass, hairColor: $hairColor, skinColor: $skinColor, eyeColor: $eyeColor, birthYear: $birthYear, gender: $gender, homeworld: $homeworld, films: $films, species: $species, vehicles: $vehicles, starships: $starships}';
  }
}
