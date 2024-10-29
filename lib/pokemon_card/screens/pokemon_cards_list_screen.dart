import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/common/pagination/logic/pagination_controller/pagination_controller_cubit.dart';
import 'package:pokemon/common/pagination/strategy/ellipsis_pagination_display_strategy.dart';
import 'package:pokemon/common/pagination/widget/pagination_navigation_widget.dart';
import 'package:pokemon/common/widgets/search_text_field.dart';
import 'package:pokemon/pokemon_card/logic/pokemon_cards_controller/pokemon_cards_controller_cubit.dart';
import 'package:pokemon/pokemon_card/repository/pokemon_cards_repository_impl.dart';
import 'package:pokemon/pokemon_card/widget/grid_shimmer_widget.dart';
import 'package:pokemon/pokemon_card/widget/pokemon_cards_widget.dart';

/// The screen that displays the list of Pokemon cards.
class PokemonCardsListScreen extends StatelessWidget {
  /// Constructs the [PokemonCardsListScreen] widget.
  const PokemonCardsListScreen({super.key});

  /// The route name for the PokemonCardsListScreen.
  static const String routeName = '/pokemon_cards_list';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonCardsControllerCubit(
            PokemonCardsRepositoryImpl(),
          )..getPokemonCards(),
        ),
        BlocProvider(
          create: (context) =>
              PaginationControllerCubit(EllipsisPaginationDisplayStrategy())
                ..setSelectedPage(1),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pokemon Cards'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: SearchTextField(
                    hint: "Search Pokemon...",
                    onQuery: (query) {
                      // Call the getPokemonCards method with the query.
                      context
                          .read<PokemonCardsControllerCubit>()
                          .searchPokemonCards(query);
                    }),
              ),
              Expanded(
                child: BlocConsumer<PokemonCardsControllerCubit,
                    PokemonCardsControllerState>(
                  listener: (context, pokemonCardsControllerState) {
                    //Update the pagination controller state.
                    context.read<PaginationControllerCubit>().setTotalPages(
                          pokemonCardsControllerState
                              .pokemonCardsDataModel.pagination.totalPages,
                        );
                  },
                  builder: (context, pokemonCardsControllerState) {
                    if (pokemonCardsControllerState.showErrorOnScreen &&
                        pokemonCardsControllerState.errorMesssage != null) {
                      return Center(
                        child: Text(pokemonCardsControllerState.errorMesssage!),
                      );
                    } else if (pokemonCardsControllerState.isLoading) {
                      return const GridShimmerWidget();
                    } else {
                      /// Get the Pokemon cards data model from the state.
                      final pokemonCardsDataModel =
                          pokemonCardsControllerState.pokemonCardsDataModel;

                      /// Build the PokemonCardsGridView widget.
                      return PokemonCardsGridView(
                        pokemonCardModel: pokemonCardsDataModel,
                        disableLoadMore:
                            pokemonCardsControllerState.disableLoadMore,
                      ).build(context);
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: PaginationNavigationWidget(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
