import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokemon/pokemon_card/models/pokemon_cards_model.dart';
import 'package:pokemon/pokemon_card/repository/pokemon_cards_repository.dart';

/// A class representing the repository for fetching Pokemon cards.ˆ
class PokemonCardsRepositoryImpl implements PokemonCardsRepository {
  @override
  Future<PokemonCardsDataModel> getPokemonCards(int page) async {
    try {
      log("*****FETCHING CARDS with PAGE: $page*****");

      final response = await Dio()
          .get('https://api.pokemontcg.io/v2/cards?page=$page&pageSize=10')
          .then((response) => PokemonCardsDataModel.fromMap(response.data));

      log("*****RESPONSE*****");
      print(response.cards.length);

      return response;
    } catch (e) {
      throw Exception('Failed to fetch Pokemon cards: $e');
    }
  }
}
