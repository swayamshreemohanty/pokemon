import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// The [ShimmerWidget] class
class ShimmerWidget extends StatelessWidget {
  /// Width of the widget.
  final double width;

  /// Height of the widget.
  final double height;

  /// Shape of the widget.
  final ShapeBorder shapeBorder;

  /// Constructs the [ShimmerWidget] widget.
  const ShimmerWidget({
    super.key,
    required this.height,
    required this.width,
    this.shapeBorder = const RoundedRectangleBorder(),
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade50,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: shapeBorder,
            color: Colors.grey.shade200,
          ),
        ),
      );
}
