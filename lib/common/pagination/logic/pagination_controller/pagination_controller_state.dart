part of 'pagination_controller_cubit.dart';

/// Pagination controller state
class PaginationControllerState extends Equatable {
  /// The selected page by the user
  final int selectedPage;

  /// The total number of pages available in the pagination
  final int totalPages;

  /// Display data model
  final PaginationDisplayDataModel displayData;

  /// Constructs the [PaginationControllerState]
  const PaginationControllerState({
    this.selectedPage = 0,
    this.totalPages = 0,
    this.displayData = const PaginationDisplayDataModel(),
  });

  @override
  List<Object> get props => [selectedPage, totalPages, displayData];

  /// Copy the current state with the new values
  PaginationControllerState copyWith({
    int? selectedPage,
    int? totalPages,
    PaginationDisplayDataModel? displayData,
  }) {
    return PaginationControllerState(
      selectedPage: selectedPage ?? this.selectedPage,
      totalPages: totalPages ?? this.totalPages,
      displayData: displayData ?? this.displayData,
    );
  }
}
