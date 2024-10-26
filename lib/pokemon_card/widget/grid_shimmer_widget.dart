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
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        childAspectRatio: 0.8,
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
