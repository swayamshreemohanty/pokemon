import 'package:pokemon/pokemon_card/models/pokemon_card/pokemon_card_model.dart';
import 'package:pokemon/util/pagination_model.dart';

/// Represents a model for a collection of Pokemon cards with pagination.
///
/// The [PokemonCardsModel] class holds a list of [PokemonCard] objects and
/// a [PaginationModel] to manage pagination details.
class PokemonCardsModel {
  /// The pagination details for the collection of Pokemon cards.
  final PaginationModel pagination;

  /// The list of Pokemon cards.
  List<PokemonCard> cards;

  /// Creates a new instance of [PokemonCardsModel].
  ///
  /// The [pagination] parameter is required and provides the pagination details.
  /// The [cards] parameter is required and provides the list of Pokemon cards.
  PokemonCardsModel({
    required this.pagination,
    required this.cards,
  });

  /// Creates a new instance of [PokemonCardsModel] from a map.
  ///
  /// The [map] parameter is a [Map] containing the data to create the model.
  /// The map should have a 'data' key with a list of Pokemon card data and
  /// other keys for pagination details.
  factory PokemonCardsModel.fromMap(Map<String, dynamic> map) {
    return PokemonCardsModel(
      pagination: PaginationModel.fromMap(map),
      cards: List<PokemonCard>.from(
        map['data'].map((x) => PokemonCard.fromMap(x)),
      ),
    );
  }
}
