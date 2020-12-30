import 'package:star_wars_challenge_flutter/imports.dart';
import 'package:star_wars_challenge_flutter/pages/home/home_viewmodel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.runYoutubePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: viewModel.youtubeController,
        aspectRatio: 4 / 3,
        topActions: [],
        bottomActions: [],
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(
                () {
                  viewModel.youtubeController.value.isPlaying
                      ? viewModel.youtubeController.pause()
                      : viewModel.youtubeController.play();
                },
              );
            },
            child: Icon(
              viewModel.youtubeController.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
          drawer: DrawerList(),
          backgroundColor: Colors.black,
          body: Center(
            child: player,
          ),
        );
      },
    );
  }

  @override
  void deactivate() {
    viewModel.youtubeController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    viewModel.youtubeController.dispose();
    super.dispose();
  }
}
