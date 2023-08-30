import 'package:flutter/material.dart';
import 'package:pokedex_app/common/error/failure.dart';
import 'package:pokedex_app/common/models/pokemon.dart';
import 'package:pokedex_app/common/repositories/pokemon_repository.dart';
import 'package:pokedex_app/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex_app/features/pokedex/screens/home/pages/home_error.dart';
import 'package:pokedex_app/features/pokedex/screens/home/pages/home_loading.dart';
import 'package:pokedex_app/features/pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {Key? key, required this.repository, required this.onItemTap})
      : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    // Implement a FutureBuilder to handle the state of the data
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: ((context, snapshot) {
          // If the connection is waiting show the HomeLoading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return HomeLoading();
          }
          // If the connection is done and we have data show the HomePage
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(
              // Pass the list of pokemons to the HomePage widget that will render the list of pokemons in a ListView
              list: snapshot.data!,
              onItemTap: onItemTap,
            );
          }
          // If the connection is done and we have an error show the HomeError
          if (snapshot.hasError) {
            return HomeError(
              error: (snapshot.error as Failure).message,
            );
          }

          return Container();
        }));
  }
}
