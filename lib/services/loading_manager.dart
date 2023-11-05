import 'package:flutter/material.dart';

import '../widgets/customs/custom_loading_indicator.dart';

class LoadingManager extends StatelessWidget {
  const LoadingManager(
      {super.key, required this.child, required this.isLoading});

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: CustomLoadingIndicator(),
            ),
          ),
      ],
    );
  }
}
