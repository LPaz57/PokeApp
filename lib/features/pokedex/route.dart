import 'package:flutter/material.dart';
import 'package:pokedex_app/common/repositories/pokemon_repository.dart';
import 'package:pokedex_app/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex_app/features/pokedex/screens/home/container/home_container.dart';

// Create a class to handle the routes
class PokedexRoute extends StatelessWidget {
  const PokedexRoute({Key? key, required this.repository}) : super(key: key);
  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    // Implement a Navigator to handle the routes
    return Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          // If the route is the home route, return the HomeContainer
          if (settings.name == '/') {
            return MaterialPageRoute(builder: (context) {
              return HomeContainer(
                repository: repository,
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            });
          }

          if (settings.name == '/details') {
            return MaterialPageRoute(builder: (context) {
              return DetailContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments),
                onBack: () => Navigator.of(context).pop(),
              );
            });
          }

          return null;
        });
  }
}
