import 'package:pokemon/pokemon_card/models/pokemon_card/pokemon_card_model.dart';
import 'package:pokemon/util/pagination_model.dart';

/// Represents a model for a collection of Pokemon cards with pagination.
///
/// The [PokemonCardsDataModel] class holds a list of [PokemonCard] objects and
/// a [PaginationModel] to manage pagination details.
class PokemonCardsDataModel {
  /// The pagination details for the collection of Pokemon cards.
  final PaginationModel pagination;

  /// The list of Pokemon cards.
  List<PokemonCard> cards;

  /// Creates a new instance of [PokemonCardsDataModel].
  ///
  /// The [pagination] parameter is required and provides the pagination details.
  /// The [cards] parameter is required and provides the list of Pokemon cards.
  PokemonCardsDataModel({
    required this.pagination,
    required this.cards,
  });

  /// Indicates if the collection of Pokemon cards has more data.
  bool get hasMoreData => ((cards.isEmpty && pagination.totalCount == 0) ||
      (cards.length < pagination.totalCount));

  /// Creates a new instance of [PokemonCardsModel] from a map.
  ///
  /// The [map] parameter is a [Map] containing the data to create the model.
  /// The map should have a 'data' key with a list of Pokemon card data and
  /// other keys for pagination details.
  factory PokemonCardsDataModel.fromMap(Map<String, dynamic> map) {
    return PokemonCardsDataModel(
      pagination: PaginationModel.fromMap(map),
      cards: List<PokemonCard>.from(
        map['data'].map((x) => PokemonCard.fromMap(x)),
      ),
    );
  }

  /// Creates a initial instance of [PokemonCardsDataModel].
  factory PokemonCardsDataModel.initial() {
    return PokemonCardsDataModel(
      pagination: PaginationModel.initial(),
      cards: [],
    );
  }

  /// Copywith method for [PokemonCardsDataModel].
  PokemonCardsDataModel paginationCopyWith({
    required PaginationModel pagination,
    required List<PokemonCard> cards,
  }) {
    // add the new cards to the existing list of cards.
    this.cards.addAll(cards);

    return PokemonCardsDataModel(
      pagination: pagination,
      cards: this.cards,
    );
  }
}
