/// The model class to hold the pagination display data
class PaginationDisplayDataModel {
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

  /// Constructs the [PaginationDisplayModel]
  const PaginationDisplayDataModel({
    this.firstPhasePages = const [],
    this.secondPhasePages = const [],
    this.thirdPhasePages = const [],
    this.hidePhase1Numbers = false,
    this.hidePhase2Numbers = false,
  });

  /// Copy the current state with the new values
  PaginationDisplayDataModel copyWith({
    List<int>? firstPhasePages,
    List<int>? secondPhasePages,
    List<int>? thirdPhasePages,
    bool? hidePhase1Numbers,
    bool? hidePhase2Numbers,
  }) {
    return PaginationDisplayDataModel(
      firstPhasePages: firstPhasePages ?? this.firstPhasePages,
      secondPhasePages: secondPhasePages ?? this.secondPhasePages,
      thirdPhasePages: thirdPhasePages ?? this.thirdPhasePages,
      hidePhase1Numbers: hidePhase1Numbers ?? this.hidePhase1Numbers,
      hidePhase2Numbers: hidePhase2Numbers ?? this.hidePhase2Numbers,
    );
  }
}
