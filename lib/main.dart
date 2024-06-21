import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sprout_mobile_developer_test/routes/main_route.dart';

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatefulWidget {
  const PokedexApp({super.key});

  @override
  State<PokedexApp> createState() => _PokedexApp();
}

class _PokedexApp extends State<PokedexApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemStatusBarContrastEnforced: true,
      ),
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: MainRoute.homeRoute,
      routes: MainRoute.routes,
    );
  }
}