import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// The widget to handle pagination loading.
class PaginationLoaderWidget extends StatelessWidget {
  /// The flag to check if there is more data to load.
  final bool hasMoreData;

  /// The function callback to load more data.
  final void Function() loadMoreData;

  /// Constructs the [PaginationLoaderWidget] widget.
  const PaginationLoaderWidget({
    super.key,
    required this.hasMoreData,
    required this.loadMoreData,
  });

  @override
  Widget build(BuildContext context) {
    //Handle pagination
    if (hasMoreData) {
      return Center(
        child: VisibilityDetector(
          key: key!,
          onVisibilityChanged: (visibilityInfo) {
            var visiblePercentage = visibilityInfo.visibleFraction * 100;
            if (visiblePercentage >= 60) {
              //Load more data
              loadMoreData.call();
            }
          },
          child: const SpinKitPouringHourGlass(
            color: Colors.blue,
            size: 40,
          ),
        ),
      );
    } else {
      return const Center(child: Text('You have reached the end!'));
    }
  }
}
