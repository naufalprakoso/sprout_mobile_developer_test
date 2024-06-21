import 'package:flutter/material.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/presentation/pages/home/home_screen.dart';

class MainRoute {
  static Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => const HomeScreen(),
  };

  static const homeRoute = '/home';
}
