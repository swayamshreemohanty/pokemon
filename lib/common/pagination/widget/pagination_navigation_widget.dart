import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/common/pagination/logic/pagination_controller/pagination_controller_cubit.dart';
import 'package:pokemon/pokemon_card/logic/pokemon_cards_controller/pokemon_cards_controller_cubit.dart';

/// The pagination navigation widget
class PaginationNavigationWidget extends StatefulWidget {
  /// The key for the widget
  const PaginationNavigationWidget({super.key});

  @override
  State<PaginationNavigationWidget> createState() =>
      _PaginationNavigationWidgetState();
}

class _PaginationNavigationWidgetState
    extends State<PaginationNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationControllerCubit, PaginationControllerState>(
      builder: (context, state) {
        final paginationDisplayData = state.displayData;
        return SizedBox(
          height: 25,
          width: 450,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Show the first phase pages
              if (paginationDisplayData.firstPhasePages.isNotEmpty)
                ...List.generate(
                  paginationDisplayData.firstPhasePages.length,
                  (index) => Flexible(
                    child: PaginationNumberWidget(
                      page: paginationDisplayData.firstPhasePages[index],
                      selectedPage: state.selectedPage,
                    ),
                  ),
                ),

              // Show the ellipsis if the first phase pages are hidden
              if (paginationDisplayData.hidePhase1Numbers) const Text(' ...'),

              // Show the second phase pages
              if (paginationDisplayData.secondPhasePages.isNotEmpty)
                ...List.generate(
                  paginationDisplayData.secondPhasePages.length,
                  (index) => Flexible(
                    child: PaginationNumberWidget(
                      page: paginationDisplayData.secondPhasePages[index],
                      selectedPage: state.selectedPage,
                    ),
                  ),
                ),

              // Show the ellipsis if the second phase pages are hidden
              if (paginationDisplayData.hidePhase2Numbers) const Text(' ...'),

              // Show the third phase pages
              if (paginationDisplayData.thirdPhasePages.isNotEmpty)
                ...List.generate(
                  paginationDisplayData.thirdPhasePages.length,
                  (index) => Flexible(
                    child: PaginationNumberWidget(
                      page: paginationDisplayData.thirdPhasePages[index],
                      selectedPage: state.selectedPage,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// The pagination number widget
class PaginationNumberWidget extends StatelessWidget {
  /// The key for the widget
  const PaginationNumberWidget({
    super.key,
    required this.page,
    required this.selectedPage,
  });

  /// The page number
  final int page;

  /// The group selected page
  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PaginationControllerCubit>().setSelectedPage(page);
        context.read<PokemonCardsControllerCubit>().getPokemonCards(page: page);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: selectedPage == page ? Colors.deepPurple : Colors.grey,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: FittedBox(
          child: Text(
            "$page",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
