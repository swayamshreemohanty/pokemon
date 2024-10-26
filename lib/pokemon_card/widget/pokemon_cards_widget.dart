import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/common/widgets/pagination_loader_widget.dart';
import 'package:pokemon/pokemon_card/logic/pokemon_cards_controller/pokemon_cards_controller_cubit.dart';
import 'package:pokemon/pokemon_card/models/pokemon_cards_model.dart';
import 'package:pokemon/pokemon_card/widget/pokemon_list_grid_widget.dart';

/// The widget that displays the list of Pokemon cards.
abstract class PokemonCardsWidget {
  /// Constructs the [PokemonCardsWidget] widget.
  Widget build(BuildContext context);
}

///Grid view of Pokemon cards.
class PokemonCardsGridView implements PokemonCardsWidget {
  /// The pokemon cards data model.
  final PokemonCardsDataModel pokemonCardModel;

  /// Constructs the [PokemonCardsGridView] widget.
  /// The [pokemonCards] parameter is required and provides the list of Pokemon cards.
  const PokemonCardsGridView(this.pokemonCardModel);

  @override
  Widget build(BuildContext context) {
    final logs = pokemonCardModel.cards;

    if (logs.isEmpty) {
      return const Center(
        child: Text('No Pokemon cards found.'),
      );
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 1,
        ),

        /// Here +1 is added to the itemCount to show the last item as loader to load more data.
        itemCount: logs.length + 1,
        itemBuilder: (context, index) {
          if (index < logs.length) {
            final pokemonCard = logs[index];
            return PokemonListGridWidget(pokemonCard: pokemonCard);
          } else {
            return PaginationLoaderWidget(
              key: const Key('PokemonCardsGridViewLoader'),
              hasMoreData: pokemonCardModel.pagination.hasNextPage,
              loadMoreData: () {
                //Load more data
                context.read<PokemonCardsControllerCubit>().getPokemonCards();
              },
            );
          }
        },
      );
    }
  }
}
