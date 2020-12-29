import 'package:star_wars_challenge_flutter/imports.dart';
import 'package:star_wars_challenge_flutter/utils/app_divider.dart';

class CharacterPage extends StatefulWidget {
  final Character character;

  CharacterPage(this.character);

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final viewModel = CharacterViewModel();
  final favoritosViewModel = FavoritesViewModel();

  Character get character => widget.character;
  var starIcon = Icons.star_border;

  @override
  void initState() {
    super.initState();

    viewModel.fetch(character.homeworld);
    _loadData();
  }

  _loadData() async {
    bool favoritado = await favoritosViewModel.repository.isFavorito(character);
    updateStarColor(favoritado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              starIcon,
              size: 30,
            ),
            onPressed: _onClickFavoritar,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: _body(),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _title('Descrição'),
          _infoCharacterCard(),
          SizedBox(
            height: 16,
          ),
          AppDivider(
            blade: Colors.blue,
            grip1: Colors.white,
            grip2: Colors.grey,
          ),
          SizedBox(
            height: 16,
          ),
          _title('Filmes'),
          _infoFilmsCard(),
        ],
      ),
    );
  }

  _title(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 20,
      ),
    );
  }

  _infoCharacterCard() {
    return Container(
      width: double.infinity,
      child: Card(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _itemCard('Altura: ${character.heightMeters} m'),
              _itemCard('Peso: ${character.mass} Kg'),
              _itemCard('Cor do cabelo: ${character.hairColor}'),
              _itemCard('Cor da pela: ${character.skinColor}'),
              _itemCard('Cor dos olhos: ${character.eyeColor}'),
              _itemCard('Ano de nascimento: ${character.birthYear}'),
              _itemCard('Gênero: ${character.gender}'),
              _homeworld(),
            ],
          ),
        ),
      ),
    );
  }

  _homeworld() {
    return StreamBuilder(
      stream: viewModel.planet$.stream,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Erro ao buscar planeta"),
          );
        }
        if (!snapshot.hasData) {
          return CircularProgressIndicator(
          );
        }

        Planet planet = snapshot.data;

        return _itemCard('Planeta natal: ${planet.name}');
      },
    );
  }

  _infoFilmsCard() {
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: _films(),
      ),
    );
  }

  _itemCard(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18),
    );
  }

  _films() {
    List films = character.film;

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: films.length,
      itemBuilder: (_, idx) {
        String f = films[idx];
        return _itemCard(f);
      },
    );
  }

  void _onClickFavoritar() async {
    final favoritado = await favoritosViewModel.save(character);
    updateStarColor(favoritado);
  }

  void updateStarColor(bool favoritado) {
    setState(() {
      starIcon = favoritado ? Icons.star : Icons.star_border;
    });
  }
}
