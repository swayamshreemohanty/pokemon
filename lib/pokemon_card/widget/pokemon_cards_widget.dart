import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/common/widgets/pagination_loader_widget.dart';
import 'package:pokemon/pokemon_card/logic/pokemon_cards_controller/pokemon_cards_controller_cubit.dart';
import 'package:pokemon/pokemon_card/models/pokemon_cards_model.dart';
import 'package:pokemon/pokemon_card/widget/pokemon_card_details_widget.dart';
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

  /// Indicates whether to allow loading more data.
  final bool disableLoadMore;

  /// Constructs the [PokemonCardsGridView] widget.
  /// The [pokemonCards] parameter is required and provides the list of Pokemon cards.
  const PokemonCardsGridView({
    required this.pokemonCardModel,
    required this.disableLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    final logs = pokemonCardModel.cards;

    if (logs.isEmpty) {
      return const Center(
        child: Text('No Pokemon cards found.'),
      );
    } else {
      return GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: 0.8,
        ),

        /// Here +1 is added to the itemCount to show the last item as loader to load more data.
        itemCount: logs.length + 1,
        itemBuilder: (context, index) {
          if (index < logs.length) {
            final pokemonCard = logs[index];
            return GestureDetector(
              onTap: () {
                //Navigate to Pokemon card details screen.
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.yellow.shade100,
                  builder: (context) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //Handle
                          Container(
                            width: 40,
                            height: 4,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),

                          //Pokemon card details widget
                          Expanded(
                            child: PokemonCardDetailsWidget(
                              pokemonCard: pokemonCard,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: PokemonListGridWidget(pokemonCard: pokemonCard),
            );
          } else {
            return PaginationLoaderWidget(
              key: const Key('PokemonCardsGridViewLoader'),
              disableLoadMore: disableLoadMore,
              hasMoreData: pokemonCardModel.hasMoreData,
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
