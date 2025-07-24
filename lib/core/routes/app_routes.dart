import 'package:flutter/material.dart';
import 'package:pizza_app/core/routes/base_routes.dart';
import 'package:pizza_app/home.dart';
import 'package:pizza_app/test1_screeen.dart';
import 'package:pizza_app/test2_screeen.dart';

class AppRoutes {
  static const String home = '/';
  static const String TestOne = '/testOne';
  static const String TestTwo = '/testTwo';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case home:
        return BaseRoute(
          page: const HomeScreen(),
        );
      case TestOne:
        return BaseRoute(page: const Test1Screeen());
      case TestTwo:
        return BaseRoute(page: const Test2Screeen());
      default:
        return BaseRoute(
          page: const HomeScreen(),
        );}
  }
}