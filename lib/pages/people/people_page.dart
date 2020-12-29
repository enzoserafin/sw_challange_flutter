import 'package:star_wars_challenge_flutter/imports.dart';

class PeoplePage extends StatefulWidget {
  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  final viewModel = PeopleViewModel();

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
        title: Text('Lista de Personagens'),
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
        stream: viewModel.people$.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Não foi possível buscar os personagens",
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

          List<People> list = snapshot.data;

          return _listView(list);
        },
      ),
    );
  }

  _listView(List<People> list) {
    List<Character> characters = List<Character>();
    list.forEach((element) => element.results.forEach((character) => characters.add(character)));

    return ListView.builder(
        controller: viewModel.scrollController,
        itemCount: characters.length,
        itemBuilder: (_, idx) {
          Character r = characters[idx];
          return Container(
            height: 80,
            margin: EdgeInsets.symmetric(vertical: 4),
            child: InkWell(
              onTap: () => _onClickCharacter(r),
              child: Card(
                color: Colors.grey,
                child: Center(
                  child: Text(
                    r.name,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _onClickCharacter(Character character) {
    push(CharacterPage(character));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
