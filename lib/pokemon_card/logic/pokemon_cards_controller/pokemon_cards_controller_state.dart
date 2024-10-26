part of 'pokemon_cards_controller_cubit.dart';

/// States for the Pokemon cards controller.
class PokemonCardsControllerState extends Equatable {
  /// Indicates if the controller is loading data.
  final bool isLoading;

  /// Indicates if an error should be shown on the screen.
  final bool showErrorOnScreen;

  /// The error message.
  final String? errorMesssage;

  /// The data model for the Pokemon cards.
  final PokemonCardsDataModel pokemonCardsDataModel;

  /// Creates a new instance of [PokemonCardsControllerState].
  const PokemonCardsControllerState({
    this.isLoading = false,
    this.showErrorOnScreen = false,
    this.errorMesssage,
    required this.pokemonCardsDataModel,
  });

  @override
  List<Object?> get props =>
      [isLoading, showErrorOnScreen, pokemonCardsDataModel, errorMesssage];

  /// CopyWith method for the Pokemon cards controller state.
  PokemonCardsControllerState copyWith({
    bool? isLoading,
    bool? showErrorOnScreen,
    String? errorMesssage,
    PokemonCardsDataModel? pokemonCardsDataModel,
  }) {
    return PokemonCardsControllerState(
      isLoading: isLoading ?? false,
      showErrorOnScreen: showErrorOnScreen ?? false,
      errorMesssage: errorMesssage,
      pokemonCardsDataModel:
          pokemonCardsDataModel ?? this.pokemonCardsDataModel,
    );
  }
}