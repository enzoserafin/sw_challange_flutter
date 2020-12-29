import 'package:star_wars_challenge_flutter/imports.dart';

class PlanetsPage extends StatefulWidget {
  @override
  _PlanetsPageState createState() => _PlanetsPageState();
}

class _PlanetsPageState extends State<PlanetsPage> {
  final viewModel = PlanetsViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.fetch();
    viewModel.addScrollListener(viewModel.scrollController, () => viewModel.fetchMore());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Planetas'),
        centerTitle: true,
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      padding: EdgeInsets.all(16),
      child: StreamBuilder(
        stream: viewModel.planets$.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Não foi possível buscar os planetas",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                ),
              ),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: AppProgress(),
            );
          }

          List<Planets> list = snapshot.data;

          return _listView(list);
        },
      ),
    );
  }

  _listView(List<Planets> list) {
    List<Planet> planets = List<Planet>();
    list.forEach((element) => element.results.forEach((planet) => planets.add(planet)));

    return ListView.builder(
        controller: viewModel.scrollController,
        itemCount: planets.length,
        itemBuilder: (_, idx) {
          Planet p = planets[idx];
          return Container(
            height: 80,
            margin: EdgeInsets.symmetric(vertical: 4),
            child: InkWell(
              onTap: () => _onClickPlanet(p),
              child: Card(
                color: Colors.grey,
                child: Center(
                  child: Text(
                    p.name,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _onClickPlanet(Planet planet) {
    print(planet);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
