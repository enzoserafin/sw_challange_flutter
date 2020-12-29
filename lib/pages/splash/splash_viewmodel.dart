import 'package:star_wars_challenge_flutter/imports.dart';

class SplashViewModel {
  void init() async {
    Future db = _initDb();

    Future delay = Future.delayed(Duration(milliseconds: 1000));

    Future.wait([db, delay]).then((value) => {push(HomePage(), replace: true)});
  }

  Future<bool> _initDb() async {
    print("Iniciando banco de dados...");
    DatabaseHelper.getInstance().db;
    print("Banco iniciado, created");
    return true;
  }
}
