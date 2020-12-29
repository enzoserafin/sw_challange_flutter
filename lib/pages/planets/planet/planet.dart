class Planet {
  String name;
  String rotationPeriod;
  String orbitalPeriod;
  String diameter;
  String climate;
  String gravity;
  String terrain;
  String surfaceWater;
  String population;
  List<String> residents;
  List<String> films;
  String created;
  String edited;
  String url;

  Planet(
      {this.name,
        this.rotationPeriod,
        this.orbitalPeriod,
        this.diameter,
        this.climate,
        this.gravity,
        this.terrain,
        this.surfaceWater,
        this.population,
        this.residents,
        this.films,
        this.created,
        this.edited,
        this.url});

  Planet.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    rotationPeriod = map['rotation_period'];
    orbitalPeriod = map['orbital_period'];
    diameter = map['diameter'];
    climate = map['climate'];
    gravity = map['gravity'];
    terrain = map['terrain'];
    surfaceWater = map['surface_water'];
    population = map['population'];
    residents = map['residents'].cast<String>();
    films = map['films'].cast<String>();
    created = map['created'];
    edited = map['edited'];
    url = map['url'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['name'] = this.name;
    map['rotation_period'] = this.rotationPeriod;
    map['orbital_period'] = this.orbitalPeriod;
    map['diameter'] = this.diameter;
    map['climate'] = this.climate;
    map['gravity'] = this.gravity;
    map['terrain'] = this.terrain;
    map['surface_water'] = this.surfaceWater;
    map['population'] = this.population;
    map['residents'] = this.residents;
    map['films'] = this.films;
    map['created'] = this.created;
    map['edited'] = this.edited;
    map['url'] = this.url;
    return map;
  }

  @override
  String toString() {
    return 'Planet{name: $name}';
  }
}