/// This class is used to handle the pagination.
class PaginationModel {
  /// The current page number.
  final int currentPage;

  /// The total number of items.
  final int totalCount;

  /// The number of items per page.
  final int pageSize;

  /// Constructor for the PaginationModel class.
  PaginationModel({
    required this.currentPage,
    required this.totalCount,
    required this.pageSize,
  });

  /// This method is used to create a PaginationModel object from a map.
  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel(
      currentPage: map['page'],
      totalCount: map['totalCount'],
      pageSize: map['pageSize'],
    );
  }

  /// This getter is used to check if the model is empty.
  /// This will true for the initial instance of PaginationModel.
  bool get isEmptyModel => totalCount == 0 && pageSize == 0;

  /// This getter is used to check if there is a next page.
  bool get hasMoreData => ((isEmptyModel) || (currentPage < totalPages));

  /// This getter is used to get the total number of pages.
  int get totalPages => (totalCount / pageSize).ceil();

  /// Initial instance of PaginationModel.
  factory PaginationModel.initial() {
    return PaginationModel(
      currentPage: 0,
      totalCount: 0,
      pageSize: 0,
    );
  }

  /// CopyWith method for PaginationModel.
  PaginationModel copyWith({
    int? currentPage,
    int? totalCount,
    int? pageSize,
  }) {
    return PaginationModel(
      currentPage: currentPage ?? this.currentPage,
      totalCount: totalCount ?? this.totalCount,
      pageSize: pageSize ?? this.pageSize,
    );
  }
}
