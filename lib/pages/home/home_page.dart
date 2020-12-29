import 'package:star_wars_challenge_flutter/imports.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Wars'),
        centerTitle: true,
      ),
      body: _body(),
      backgroundColor: Colors.black,
      drawer: DrawerList(),
    );
  }

  _body() {
    return Center(
      child: Text(
        'Animação de inicialização do Star Wars',
        style: TextStyle(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
