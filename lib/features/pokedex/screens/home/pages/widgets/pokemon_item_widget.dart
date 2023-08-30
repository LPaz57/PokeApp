import 'package:flutter/material.dart';
import 'package:pokedex_app/common/models/pokemon.dart';
import 'package:pokedex_app/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex_app/features/pokedex/screens/home/pages/widgets/type_widget.dart';

// Create a widget to display the pokemon item information
class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget(
      {super.key,
      required this.pokemon,
      required this.onTap,
      required this.index});

  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    // Wrap the widget with a GestureDetector to handle the tap event
    return GestureDetector(
      // the function onTap is called when the user taps on the widget and it receives a function that will be called when the user taps on the widget. The function onTap receives a route and an argument. The route is the route that will be pushed to the Navigator and the argument is the argument that will be passed to the route.
      onTap: () => onTap(
          '/details',
          DetailArguments(
            pokemon: pokemon,
            index: index,
          )),
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                color: pokemon.baseColor!.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(pokemon.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Text('#${pokemon.num}',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              // pokemon is an object representing a Pokemon, and pokemon.type is a list that contains the types of that Pokemon. The map function is used to transform each element of the pokemon.type list into a TypeWidget object. It iterates over each element in the pokemon.type list and creates a new TypeWidget instance with the name property set to the current element e.
                              pokemon.type
                                  .map((e) => TypeWidget(name: e))
                                  .toList(),
                        ),
                        Flexible(
                            child: Container(
                          height: 96,
                          width: 100,
                        ))
                      ],
                    )
                  ],
                ),
              )),
          Positioned(
            bottom: 12,
            right: 2,
            child: Image.network(
              pokemon.img,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
