import 'package:star_wars_challenge_flutter/imports.dart';

class AppDivider extends StatelessWidget {
  final Color blade;
  final Color grip1;
  final Color grip2;

  AppDivider({
    this.blade,
    this.grip1 = Colors.black,
    this.grip2 = Colors.black26,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: grip2,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        bottomLeft: Radius.circular(45),
                      ),
                    ),
                    height: 10,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 10,
                    color: grip1,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 10,
                    color: grip2,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: grip1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 10,
                    color: grip2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: blade,
                  width: 4,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
              ),
              height: 10,
            ),
          )
        ],
      ),
    );
  }
}
