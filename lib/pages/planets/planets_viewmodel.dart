import 'package:star_wars_challenge_flutter/imports.dart';


class PlanetsViewModel {
  int _page = 2;
  List<Planets> list = List<Planets>();
  final planets$ = StreamController<List<Planets>>();
  PlanetsRepository repository = PlanetsRepository();
  var scrollController = ScrollController();

  void addScrollListener(ScrollController scrollController, Function callback) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        callback();
      }
    });
  }

  void fetch({String page = '1'}) async {
    Planets planets = await repository.getPlanets(page);
    list.add(planets);
    planets$.add(list);
  }

  void fetchMore() async {
    if (_page < 10) {
      fetch(page: _page.toString());
      _page++;
    }
  }

  void close() {
    planets$.close();
  }
}
