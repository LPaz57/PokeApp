import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/common/repositories/pokemon_repository.dart';
import 'package:pokedex_app/features/pokedex/route.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Pokedex App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PokedexRoute(
          repository: PokemonRepository(dio: Dio()),
        )

        // HomeContainer(
        //   // Inject the repository
        //   repository: PokemonRepository(dio: Dio()),
        // )
        );
  }
}
