import 'package:star_wars_challenge_flutter/imports.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final viewModel = FavoritesViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personagens favoritos'),
        centerTitle: true,
      ),
      body: _body(),
      backgroundColor: Colors.black,
      drawer: DrawerList(),
    );
  }

  _body() {
    return StreamBuilder(
      stream: viewModel.people$.stream,
      builder: (_, snapshot) {
        return _listView(snapshot.data);
      },
    );
  }

  _listView(List<Character> list) {
    if (list == null || list.isEmpty) {
      return Center(
        child: Text(
          "Você não possui nenhum personagem favorito."
          "\n\nPara favoritar, toque na estrela na tela do personagem.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 20,
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, idx) {
          Character c = list[idx];
          return Column(
            children: [
              ListTile(
                onTap: () => _onClickCharacter(c),
                leading: GestureDetector(
                  onTap: () => _onClickDelete(c),
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
                title: Text(
                  c.name,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _onClickDelete(Character c) => viewModel.delete(c);

  _onClickCharacter(Character c) async {
    await push(CharacterPage(c));
    viewModel.fetch();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.close();
  }
}
