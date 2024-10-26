/// This class is used to handle the pagination.
class PaginationModel {
  /// The current page number.
  int currentPage;

  /// The total number of items.
  final int totalCount;

  /// The current page items count.
  final int count;

  /// Constructor for the PaginationModel class.
  PaginationModel({
    required this.currentPage,
    required this.totalCount,
    required this.count,
  });

  /// This method is used to create a PaginationModel object from a map.
  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel(
      currentPage: map['page'],
      totalCount: 50,
      count: map['count'],
    );
  }

  /// This getter is used to get the next page number.
  int get nextPage {
    return currentPage += 1;
  }

  /// Initial instance of PaginationModel.
  factory PaginationModel.initial() {
    return PaginationModel(
      currentPage: 0,
      totalCount: 0,
      count: 0,
    );
  }
}
