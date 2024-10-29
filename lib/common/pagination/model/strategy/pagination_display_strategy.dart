import 'package:pokemon/common/pagination/model/strategy/model/pagination_display_model.dart';

/// Strategy for determining the visibility of pagination numbers based on the selected page and total pages.
abstract class PaginationDisplayStrategy {
  /// This method used to arrange the visible pages based on the selected page and total pages.
  PaginationDisplayDataModel arrangeVisiblePages({
    required int selectedPage,
    required int totalPages,
  });
}
