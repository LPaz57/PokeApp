import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_app/common/consts/api_consts.dart';
import 'package:pokedex_app/common/error/failure.dart';

import '../models/pokemon.dart';

// 1. Create an abstract class IPokemonRepository
abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

// 2. Create a class PokemonRepository that implements IPokemonRepository
class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      // Use the Dio instance to make a GET request to the API
      final response = await dio.get(ApiConsts.allPokemonsURL);
      // Decode the response into a Map
      final json = jsonDecode(response.data) as Map<String, dynamic>;

      // Get the list of pokemons from the response and convert it to a list of Pokemon objects
      final list = json['pokemon'] as List<dynamic>;

      // Return the list of Pokemon objects from the response
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Something went wrong');
    }
  }
}
