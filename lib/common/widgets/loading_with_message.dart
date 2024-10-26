import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// The widget that displays a loading spinner with a message.
class LoadingWithMessage extends StatelessWidget {
  /// The message to display.
  final String message;

  /// Constructs the [LoadingWithMessage] widget.
  const LoadingWithMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SpinKitThreeInOut(),
        Text(message),
      ],
    );
  }
}
