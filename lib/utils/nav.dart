import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

BuildContext get globalContext => navigatorKey.currentState.overlay.context;

Future push(Widget page, {bool replace = false, bool popAll = false}) {

  final fadePage = FadeRoute(
      builder: (_) {
        return page;
      });

  if (popAll) {
    return navigatorKey.currentState
        .pushAndRemoveUntil(fadePage, ModalRoute.withName('/'));
  }

  if (replace) {
    return navigatorKey.currentState.pushReplacement(fadePage);
  }

  return navigatorKey.currentState.push(fadePage);
}

bool pop<T extends Object>([T result]) {
  if (navigatorKey.currentState.canPop()) {
    navigatorKey.currentState.pop(result);
    return true;
  }
  return false;
}

class FadeRoute<T> extends MaterialPageRoute<T> {
  FadeRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
