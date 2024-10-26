import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/pokemon_card/models/pokemon_cards_model.dart';
import 'package:pokemon/pokemon_card/repository/pokemon_cards_repository.dart';

part 'pokemon_cards_controller_state.dart';

/// Cubit controller for Pokemon cards.
class PokemonCardsControllerCubit extends Cubit<PokemonCardsControllerState> {
  final PokemonCardsRepository _pokemonCardsRepository;

  /// Creates a new instance of [PokemonCardsControllerCubit].
  PokemonCardsControllerCubit(this._pokemonCardsRepository)
      : super(PokemonCardsControllerState(
            pokemonCardsDataModel: PokemonCardsDataModel.initial()));

  /// The initial state of the Pokemon cards data model.
  PokemonCardsDataModel pokemonCardsDataModel = PokemonCardsDataModel.initial();

  /// Fetches a list of Pokemon cards.
  /// If this method is called repeatedly, it will fetch the next page of Pokemon cards.
  Future<void> getPokemonCards() async {
    try {
      // Check if there is a next page.
      if (state.pokemonCardsDataModel.pagination.hasNextPage) {
        // If the list of Pokemon cards is empty, then set the loading state to true.
        if (state.pokemonCardsDataModel.cards.isEmpty) {
          emit(state.copyWith(isLoading: true));
        }

        // Fetch the Pokemon cards data.
        final updatedData = await _pokemonCardsRepository.getPokemonCards(
          page: state.pokemonCardsDataModel.pagination.nextPage,
        );

        // emit the new state with the updated Pokemon cards data model.
        emit(
          state.copyWith(
            pokemonCardsDataModel: pokemonCardsDataModel.paginationCopyWith(
              pagination: updatedData.pagination,
              cards: updatedData.cards,
            ),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(hasError: true));
    }
  }
}
