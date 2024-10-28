import 'package:flutter/material.dart';
import 'package:pokemon/util/pagination_model.dart';

class PaginationNavigationWidget extends StatefulWidget {
  final bool disableLoadMore;
  final PaginationModel pagination;
  final void Function(int page) onPageSelect;

  const PaginationNavigationWidget({
    super.key,
    required this.disableLoadMore,
    required this.pagination,
    required this.onPageSelect,
  });

  @override
  State<PaginationNavigationWidget> createState() =>
      _PaginationNavigationWidgetState();
}

class _PaginationNavigationWidgetState
    extends State<PaginationNavigationWidget> {
  static const int maxVisiblePages = 7;
  

  @override
  void initState() {
    super.initState();
    updateVisiblePages();
  }

  void updateVisiblePages() {
    setState(() {
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var page in visiblePages)
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedPage = page;
                  widget.onPageSelect(page);
                  updateVisiblePages();
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: selectedPage == page ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  "$page",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        if (selectedPage < totalPages - 3) const Text(' ...'),
      ],
    );
  }
}
