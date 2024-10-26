part of 'pokemon_cards_controller_cubit.dart';

/// States for the Pokemon cards controller.
class PokemonCardsControllerState extends Equatable {
  /// Indicates if the controller is loading data.
  final bool isLoading;

  /// Indicates if the controller has an error.
  final bool hasError;

  /// The data model for the Pokemon cards.
  final PokemonCardsDataModel pokemonCardsDataModel;

  /// Creates a new instance of [PokemonCardsControllerState].
  const PokemonCardsControllerState({
    this.isLoading = false,
    this.hasError = false,
    required this.pokemonCardsDataModel,
  });

  @override
  List<Object?> get props => [isLoading, hasError, pokemonCardsDataModel];

  /// CopyWith method for the Pokemon cards controller state.
  PokemonCardsControllerState copyWith({
    bool? isLoading,
    bool? hasError,
    PokemonCardsDataModel? pokemonCardsDataModel,
  }) {
    return PokemonCardsControllerState(
      isLoading: isLoading ?? false,
      hasError: hasError ?? false,
      pokemonCardsDataModel:
          pokemonCardsDataModel ?? this.pokemonCardsDataModel,
    );
  }
}
