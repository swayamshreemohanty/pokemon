import 'package:dio/dio.dart';
import 'package:pokemon/pokemon_card/models/pokemon_cards_model.dart';
import 'package:pokemon/pokemon_card/repository/pokemon_cards_repository.dart';

/// A class representing the repository for fetching Pokemon cards.ˆ
class PokemonCardsRepositoryImpl implements PokemonCardsRepository {
  @override
  Future<PokemonCardsDataModel> getPokemonCards(int page) async {
    try {
      return await Dio()
          .get('https://api.pokemontcg.io/v2/cards?page=$page&pageSize=10')
          .then((response) => PokemonCardsDataModel.fromMap(response.data));
    } catch (e) {
      throw Exception('Failed to fetch Pokemon cards: $e');
    }
  }
}
