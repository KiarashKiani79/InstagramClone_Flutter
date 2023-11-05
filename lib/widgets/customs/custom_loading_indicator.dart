import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/device_size.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Device.buttonHeight,
      width: Device.buttonHeight,
      child: LoadingIndicator(
        indicatorType: Indicator.ballSpinFadeLoader,
        colors: [
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.tertiary,
        ],
      ),
    );
  }
}
