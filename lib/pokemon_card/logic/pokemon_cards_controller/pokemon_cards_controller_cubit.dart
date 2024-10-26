import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
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
  PokemonCardsDataModel _pokemonCardsDataModel =
      PokemonCardsDataModel.initial();

  /// Fetches a list of Pokemon cards.
  /// If this method is called repeatedly, it will fetch the next page of Pokemon cards.
  Future<void> getPokemonCards() async {
    try {
      // Check if there is a next page.
      if (_pokemonCardsDataModel.hasMoreData) {
        // If the list of Pokemon cards is empty, then set the loading state to true.
        if (state.pokemonCardsDataModel.cards.isEmpty) {
          emit(state.copyWith(isLoading: true));
        }

        // Fetch the Pokemon cards data.
        final updatedData = await compute(
          _pokemonCardsRepository.getPokemonCards,
          state.pokemonCardsDataModel.pagination.nextPage,
        );

        // Update the Pokemon cards data model with the new data.
        _pokemonCardsDataModel = _pokemonCardsDataModel.paginationCopyWith(
          pagination: updatedData.pagination,
          cards: updatedData.cards,
        );

        // emit the new state with the updated Pokemon cards data model.
        emit(state.copyWith(pokemonCardsDataModel: _pokemonCardsDataModel));
      }
    } catch (e) {
      emit(
        state.copyWith(
          /// If the list of Pokemon cards is empty, then set the error state to true in the exception block.
          /// Because the error state is set to true, the error message will be displayed on the screen.
          showErrorOnScreen:
              state.pokemonCardsDataModel.cards.isEmpty ? true : false,
          errorMesssage: "An error occurred while fetching Pokemon cards.",
        ),
      );
    }
  }

  /// Searches for Pokemon cards based on the query.
  /// The state cards list will be used to filter the cards based on the query.

  void searchPokemonCards(String query) {
    final trimmedQuery = query.trim().toLowerCase();
    final isQueryNotEmpty = trimmedQuery.isNotEmpty;

    final filteredCards = isQueryNotEmpty
        ? _pokemonCardsDataModel.cards
            .where((card) => card.name.toLowerCase().contains(trimmedQuery))
            .toList()
        : _pokemonCardsDataModel.cards;

    emit(
      state.copyWith(
        disableLoadMore: isQueryNotEmpty,
        pokemonCardsDataModel: PokemonCardsDataModel(
          pagination: _pokemonCardsDataModel.pagination,
          cards: filteredCards,
        ),
      ),
    );
  }
}
