import 'package:star_wars_challenge_flutter/imports.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final viewModel = SplashViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/imgs/splashScreen.png",
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
        ),
      ),
    );
  }
}
