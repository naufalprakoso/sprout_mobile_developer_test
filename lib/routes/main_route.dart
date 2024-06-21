import 'package:flutter/material.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/presentation/pages/detail/pokemon_detail_screen.dart';
import 'package:sprout_mobile_developer_test/features/pokemon/presentation/pages/home/home_screen.dart';

class MainRoute {
  static Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => const HomeScreen(),
    detailRoute: (context) => const PokemonDetailScreen(),
  };

  static const homeRoute = '/home';
  static const detailRoute = '/detail';
}
