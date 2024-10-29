import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pagination_controller_state.dart';

/// The cubit to handle the pagination controller
class PaginationControllerCubit extends Cubit<PaginationControllerState> {
  /// Constructs the [PaginationControllerCubit]
  PaginationControllerCubit() : super(const PaginationControllerState());

  /// Set the total number of pages only once
  /// when the total pages number fetched from the server
  void setTotalPages(int totalPages) {
    emit(state.copyWith(totalPages: totalPages));
    _updateNumberVisibility();
  }

  /// 1. If total pages is <= 15, then we will show all 1st phase pages.
  /// ex: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
  ///
  /// 2. If total pages is > 15, less than or equal to 30, then we will show 1st phase pages from 1 to 7 and 2nd phase pages from 28 to 30.
  /// ex: 1 2 3 4 5 6 7 ... 28 29 30
  /// for 1000 pages, it will be like 1 2 3 4 5 6 7 ... 998 999 1000
  ///
  /// ****If user interacts with the pagination, then we will show the pages based on the selected page.***
  ///
  /// 3. If selected page is <= 7, then we will show 1st phase pages from 1 to 7 and 2nd phase pages from 28 to 30.
  /// ex: 1 2 3 4 5 6 7 ... 28 29 30
  /// ex: 1 2 3 4 5 6 7 ... 998 999 1000
  ///
  /// 4. If selected page is > 7 and < totalPages - 3, then we will show 1st phase pages 1 and 2nd phase pages from selected page - 1 to selected page + 1.
  /// ex: 1 ... 20 21 22 23 24 25 ... 998 999 1000
  ///
  /// 5. If selected page is >= totalPages - 3, then we will show 1st phase pages 1 and 2nd phase pages from totalPages - 6 to totalPages.
  /// ex: 1 ... 995 996 997 998 999 1000
  ///
  /// Set the selected page
  void _updateNumberVisibility() {
    // Get the total number of pages
    final totalPages = state.totalPages;

    // Get the total number of pages
    final selectedPage = state.selectedPage;

    if (totalPages <= 15) {
      // Case 1: Show all pages if total pages <= 15
      emit(state.copyWith(
        firstPhasePages: List.generate(totalPages, (index) => index + 1),
        secondPhasePages: [],
        thirdPhasePages: [],
        hidePhase1Numbers: false,
        hidePhase2Numbers: false,
      ));
    } else {
      List<int> firstPhasePages = [];
      List<int> secondPhasePages = [];
      List<int> thirdPhasePages = [];
      bool hidePhase1Numbers = false;
      bool hidePhase2Numbers = false;

      if (selectedPage < 7) {
        // Case 2 & 3: Show pages 1 to 7 and last 3 pages if selectedPage <= 7
        firstPhasePages = List.generate(7, (index) => index + 1);
        hidePhase1Numbers = true;
        thirdPhasePages = List.generate(3, (index) => totalPages - 2 + index);
        hidePhase2Numbers = false;
      } else if (selectedPage >= 7 && selectedPage < totalPages - 3) {
        // Case 4: Show page 1, pages around selectedPage, and last 3 pages
        firstPhasePages = [1];
        secondPhasePages =
            List.generate(5, (index) => selectedPage - 1 + index);
        thirdPhasePages = [totalPages - 2, totalPages - 1, totalPages];
        hidePhase1Numbers = true;
        hidePhase2Numbers = true;
      } else {
        // Case 5: Show page 1 and last 6 pages if selectedPage >= totalPages - 3
        firstPhasePages = [1];
        secondPhasePages = List.generate(6, (index) => totalPages - 5 + index);
        hidePhase1Numbers = true;
        hidePhase2Numbers = false;
      }

      emit(state.copyWith(
        firstPhasePages: firstPhasePages,
        secondPhasePages: secondPhasePages,
        thirdPhasePages: thirdPhasePages,
        hidePhase1Numbers: hidePhase1Numbers,
        hidePhase2Numbers: hidePhase2Numbers,
      ));
    }
  }

  /// Set the selected page
  void setSelectedPage(int selectedPage) {
    emit(state.copyWith(selectedPage: selectedPage));
    _updateNumberVisibility();
  }
}
