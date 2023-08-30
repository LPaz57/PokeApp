import 'package:flutter/material.dart';
import 'package:pokedex_app/common/error/failure.dart';
import 'package:pokedex_app/common/models/pokemon.dart';
import 'package:pokedex_app/common/repositories/pokemon_repository.dart';
import 'package:pokedex_app/common/widgets/po_error.dart';
import 'package:pokedex_app/common/widgets/po_loading.dart';
import 'package:pokedex_app/features/pokedex/screens/details/pages/detail_page.dart';

// class DetailArguments is a class to handle the arguments of the DetailPage
class DetailArguments {
  DetailArguments({this.index = 0, required this.pokemon});
  final Pokemon pokemon;
  final int? index;
}

// Class DetailContainer is a StatefulWidget because we need to pass the list of pokemons to the DetailPage widget
class DetailContainer extends StatefulWidget {
  const DetailContainer(
      {Key? key,
      required this.repository,
      required this.arguments,
      required this.onBack})
      : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController controller;
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon;

// The initState is the first method that is called when the widget is created so we can initialize the PageController and the Future to get the list of pokemons from the repository and store it in the _future variable to use it later
  @override
  void initState() {
    controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.arguments.index!,
    );
    _future = widget.repository.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Implement a FutureBuilder to handle the state of the data
    return FutureBuilder<List<Pokemon>>(
        future: _future,
        builder: ((context, snapshot) {
          // If the connection is waiting show the HomeLoading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PoLoading();
          }
          // If the connection is done and we have data show the HomePage
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (_pokemon == null) {
              _pokemon = widget.arguments.pokemon;
            }
            return DetailPage(
              pokemon: _pokemon!,
              list: snapshot.data!,
              onBack: widget.onBack,
              controller: controller,
              // onPokemonChanged is a callback that will be called when the user taps on a pokemon in the list of pokemons
              onPokemonChanged: (Pokemon value) {
                setState(() {
                  _pokemon = value;
                });
              },
            );
          }
          // If the connection is done and we have an error show the HomeError
          if (snapshot.hasError) {
            return PoError(
              error: (snapshot.error as Failure).message,
            );
          }

          return Container();
        }));
  }
}
