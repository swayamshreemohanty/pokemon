import 'package:flutter/widgets.dart';
import 'package:pokemon/common/widgets/shimmer_widget.dart';

/// The [GridShimmerWidget] class
class GridShimmerWidget extends StatelessWidget {
  /// Constructs the [GridShimmerWidget] widget.
  const GridShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /// Loading shimmer effect
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 1,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        return ShimmerWidget(
          width: 80,
          height: 80,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      },
    );
  }
}
