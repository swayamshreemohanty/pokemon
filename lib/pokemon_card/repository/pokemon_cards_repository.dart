import 'package:pokemon/pokemon_card/models/pokemon_cards_model.dart';

/// Abstract class for PokemonCardsRepository
abstract class PokemonCardsRepository {
  /// Fetches a list of Pokemon cards.
  Future<PokemonCardsDataModel> getPokemonCards({required int page});
}
