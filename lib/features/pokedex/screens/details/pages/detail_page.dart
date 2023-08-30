import 'package:flutter/material.dart';
import 'package:pokedex_app/common/models/pokemon.dart';
import 'package:pokedex_app/features/pokedex/screens/details/pages/widgets/detail_appbar_widget.dart';
import 'package:pokedex_app/features/pokedex/screens/details/pages/widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  DetailPage(
      {super.key,
      required this.pokemon,
      required this.list,
      required this.onBack,
      required this.controller,
      required this.onPokemonChanged});
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onPokemonChanged;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;
  bool isOnTop = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            if (scrollController.position.pixels > 35) {
              setState(() {
                isOnTop = false;
              });
            } else if (scrollController.position.pixels <= 34) {
              setState(() {
                isOnTop = true;
              });
            }
          });
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            DetailAppBarWidget(
                isOnTop: isOnTop,
                pokemon: widget.pokemon,
                onBack: widget.onBack),
            DetailListWidget(
              pokemon: widget.pokemon,
              list: widget.list,
              controller: widget.controller,
              onPokemonChanged: widget.onPokemonChanged,
            ),
            // this widget is used to fill the remaining space in the screen
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      color: widget.pokemon.baseColor,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
