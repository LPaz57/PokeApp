// Purpose: Pokemon model
import 'dart:ui';

import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final List<String> type;
  final int id;
  final String num;

  // factory constructor that returns a Pokemon object from a map of strings and dynamic values
  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      num: json['num'],
      // type is a list of strings, so we need to cast it to a list of strings using the map method
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

// this getter returns the base color of the pokemon based on its type
  Color? get baseColor => _colorType(type: type[0]);

  String get img =>
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';

  Pokemon(
      {required this.name,
      required this.type,
      required this.id,
      required this.num});

// this method returns a color based on the type of the pokemon
  static Color? _colorType({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return const Color.fromRGBO(76, 175, 80, 1);
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
