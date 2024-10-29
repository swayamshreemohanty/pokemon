part of 'pagination_controller_cubit.dart';

/// Pagination controller state
class PaginationControllerState extends Equatable {
  /// The selected page by the user
  final int selectedPage;

  /// The total number of pages available in the pagination
  final int totalPages;

  /// The list of visible pages in phase 1
  final List<int> firstPhasePages;

  /// The list of visible pages in phase 2
  final List<int> secondPhasePages;

  /// The list of visible pages in phase 3
  final List<int> thirdPhasePages;

  /// The flag to hide phase 1 numbers with ellipsis (...)
  final bool hidePhase1Numbers;

  /// The flag to hide phase 2 numbers with ellipsis (...)
  final bool hidePhase2Numbers;

  /// Constructs the [PaginationControllerState]
  const PaginationControllerState({
    this.selectedPage = 0,
    this.totalPages = 0,
    this.firstPhasePages = const [],
    this.secondPhasePages = const [],
    this.thirdPhasePages = const [],
    this.hidePhase1Numbers = false,
    this.hidePhase2Numbers = false,
  });

  @override
  List<Object> get props => [
        selectedPage,
        totalPages,
        firstPhasePages,
        secondPhasePages,
        thirdPhasePages,
        hidePhase1Numbers,
        hidePhase2Numbers,
      ];

  /// Copy the current state with the new values
  PaginationControllerState copyWith({
    int? selectedPage,
    int? totalPages,
    List<int>? firstPhasePages,
    List<int>? secondPhasePages,
    List<int>? thirdPhasePages,
    bool? hidePhase1Numbers,
    bool? hidePhase2Numbers,
  }) {
    return PaginationControllerState(
      selectedPage: selectedPage ?? this.selectedPage,
      totalPages: totalPages ?? this.totalPages,
      firstPhasePages: firstPhasePages ?? this.firstPhasePages,
      secondPhasePages: secondPhasePages ?? this.secondPhasePages,
      thirdPhasePages: thirdPhasePages ?? this.thirdPhasePages,
      hidePhase1Numbers: hidePhase1Numbers ?? this.hidePhase1Numbers,
      hidePhase2Numbers: hidePhase2Numbers ?? this.hidePhase2Numbers,
    );
  }
}
