
import 'package:flutter/material.dart';


class MyRouterDelegate extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteSettings> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate(this.navigatorKey);

  RouteSettings? _currentConfiguration;

  @override
  RouteSettings? get currentConfiguration => _currentConfiguration;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: const [
        // MaterialPage(
        //   child:
        //   NotificationScreen())
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) async {
    _currentConfiguration = configuration;
  }
}
