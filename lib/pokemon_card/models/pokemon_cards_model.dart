import 'package:pokemon/pokemon_card/models/pokemon_card/pokemon_card_model.dart';
import 'package:pokemon/common/pagination/model/pagination_model.dart';

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

  /// Creates a copy of the current instance with updated values.
  ///
  /// The [pagination] and [cards] parameters are optional and will default to
  /// the current instance's values if not provided.
  PokemonCardsDataModel copyWith({
    PaginationModel? pagination,
    List<PokemonCard>? cards,
  }) {
    return PokemonCardsDataModel(
      pagination: pagination ?? this.pagination,
      cards: cards ?? this.cards,
    );
  }
}
