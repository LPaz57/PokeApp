import 'package:flutter/material.dart';
import 'package:pokedex_app/common/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget(
      {super.key, required this.isDifferent, required this.pokemon});
  final bool isDifferent;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        // The Opacity widget is used to set the opacity of the Image widget. The opacity is set to 0.5 if the current element e is not the selected Pokemon, otherwise it is set to 1.
        duration: const Duration(milliseconds: 200),
        opacity: isDifferent ? 0.4 : 1,
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          tween: Tween<double>(
              end: isDifferent ? 100 : 200, begin: isDifferent ? 200 : 100),
          builder: (context, value, child) {
            return Image.network(
              pokemon.img,
              width: value,
              fit: BoxFit.contain,
              color: isDifferent ? Colors.black.withOpacity(0.4) : null,
            );
          },
        ),
      ),
    );
  }
}
