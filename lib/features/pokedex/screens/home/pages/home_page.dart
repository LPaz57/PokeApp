import 'package:flutter/material.dart';
import 'package:pokedex_app/common/models/pokemon.dart';
import 'package:pokedex_app/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex_app/features/pokedex/screens/home/pages/widgets/pokemon_item_widget.dart';

//
class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);
  final List<Pokemon> list;
  // Add the onItemTap function that will be called when the user taps on a list item
  final Function(String, DetailArguments) onItemTap;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Pokedex',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AwanZaman'),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu, color: Colors.black),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: list
                .map((e) => PokemonItemWidget(
                      pokemon: e,
                      onTap: onItemTap,
                      index: list.indexOf(e),
                    ))
                .toList(),
          ),
        ));
  }
}
