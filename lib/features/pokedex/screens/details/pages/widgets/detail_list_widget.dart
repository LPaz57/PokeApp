import 'package:flutter/material.dart';
import 'package:pokedex_app/common/models/pokemon.dart';
import 'package:pokedex_app/features/pokedex/screens/details/pages/widgets/detail_item_list_widget.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget(
      {super.key,
      required this.pokemon,
      required this.list,
      required this.controller,
      required this.onPokemonChanged});
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onPokemonChanged;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        pokemon.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '#${pokemon.num}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: PageView(
                    // The PageView widget receives a list of widgets that will be scrolled horizontally. The map function iterates over each element in the list and creates a new Image widget with the image property set to the current element e.
                    //The controller is used to set the initial page of the PageView.
                    onPageChanged: (index) {
                      onPokemonChanged(list[index]);
                    },
                    controller: controller,
                    children: list.map((e) {
                      bool different = e.name != pokemon.name;
                      return DetailItemListWidget(
                          isDifferent: different, pokemon: e);
                    }).toList()),
              )
            ]),
      ),
    );
  }
}
