/// This class is used to handle the pagination.
class PaginationModel {
  /// The current page number.
  final int currentPage;

  /// The total number of pages.
  final int totalPages;

  /// Constructor for the PaginationModel class.
  PaginationModel({
    required this.currentPage,
    required this.totalPages,
  });

  /// This method is used to create a PaginationModel object from a map.
  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel(
      currentPage: map['page'],

      // Here I used the hardcoded value of 250 for totalPages
      // because the API provides a totalCount which is not valid.
      // In the API, "totalCount" is 18239, but when I try to fetch data beyond page 250,
      // the maximum page is 250. Therefore, the total count is not valid, so I used the hardcoded value.
      totalPages: 250,
    );
  }

  /// This getter is used to check if it is the last page.
  bool get isLastPage => currentPage == totalPages;

  /// This getter is used to check if there is a next page.
  bool get hasNextPage => currentPage < totalPages;

  /// This getter is used to get the next page number.
  int get nextPage => currentPage + 1;
}
