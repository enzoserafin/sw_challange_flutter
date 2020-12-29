import 'package:star_wars_challenge_flutter/imports.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.grey,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/imgs/avatar.png',
                  ),
                ),
                accountName: Text('Enzo Serafin'),
                accountEmail: Text('enzoserafin@gmail.com'),
              ),
              _itemDrawer(HomePage(), Icons.home, 'Home'),
              AppDivider(blade: Colors.green),
              _itemDrawer(PeoplePage(), Icons.people, 'Personagens'),
              AppDivider(blade: Colors.blue),
              _itemDrawer(PlanetsPage(), LineAwesomeIcons.globe, 'Planetas'),
              // RaisedButton(
              //   onPressed: null,
              //   child: Text('Filmes'),
              // ),
              // RaisedButton(
              //   onPressed: null,
              //   child: Text('Espécies'),
              // ),
              // RaisedButton(
              //   onPressed: null,
              //   child: Text('Veículos'),
              // ),
              // RaisedButton(
              //   onPressed: null,
              //   child: Text('Espaçonaves'),
              // ),
              AppDivider(
                blade: Colors.red,
              ),
              _itemDrawer(FavoritesPage(), Icons.favorite, 'Favoritos'),
            ],
          ),
        ),
      ),
    );
  }

  _itemDrawer(Widget page, IconData icon, String text) {
    return ListTile(
      onTap: () => _onClickPush(page),
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
    );
  }

  _onClickPush(page) {
    push(page, replace: true);
  }
}
