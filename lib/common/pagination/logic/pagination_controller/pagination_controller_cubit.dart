import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/common/pagination/strategy/model/pagination_display_model.dart';
import 'package:pokemon/common/pagination/strategy/pagination_display_strategy.dart';

part 'pagination_controller_state.dart';

/// The cubit to handle the pagination controller
class PaginationControllerCubit extends Cubit<PaginationControllerState> {
  final PaginationDisplayStrategy _paginationDisplayStrategy;

  /// Constructs the [PaginationControllerCubit]
  PaginationControllerCubit(this._paginationDisplayStrategy)
      : super(const PaginationControllerState());

  /// Set the total number of pages only once
  /// when the total pages number fetched from the server
  void setTotalPages(int totalPages) {
    emit(state.copyWith(totalPages: totalPages));

    final updatedData = _paginationDisplayStrategy.arrangeVisiblePages(
      selectedPage: state.selectedPage,
      totalPages: totalPages,
    );

    emit(state.copyWith(displayData: updatedData));
  }

  /// Set the selected page
  void setSelectedPage(int selectedPage) {
    emit(state.copyWith(selectedPage: selectedPage));

    final updatedData = _paginationDisplayStrategy.arrangeVisiblePages(
      selectedPage: selectedPage,
      totalPages: state.totalPages,
    );

    emit(state.copyWith(displayData: updatedData));
  }
}
