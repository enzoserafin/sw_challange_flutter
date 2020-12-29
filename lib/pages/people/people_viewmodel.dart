import 'package:star_wars_challenge_flutter/imports.dart';

class PeopleViewModel {
  int _page = 2;
  List<People> list = List<People>();
  final people$ = StreamController<List<People>>();
  PeopleRepository repository = PeopleRepository();
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
    People people = await repository.getPeople(page);
    list.add(people);
    people$.add(list);
  }

  void fetchMore() async {
    if (_page < 10) {
      fetch(page: _page.toString());
      _page++;
    }
  }

  void close() {
    people$.close();
  }
}
