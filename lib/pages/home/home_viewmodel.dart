import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeViewModel {
  YoutubePlayerController youtubeController;

  void runYoutubePlayer() {
   youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId('https://youtu.be/tGQt1XQ9pRE'),
      flags: YoutubePlayerFlags(
        controlsVisibleAtStart: false,
        enableCaption: false,
        isLive: false,
        autoPlay: false,
        hideThumbnail: true,
        disableDragSeek: true,
        hideControls: true
      ),
    );
  }
}