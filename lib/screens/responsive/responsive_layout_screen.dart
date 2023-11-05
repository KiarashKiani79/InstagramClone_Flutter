import 'package:flutter/material.dart';

import '../../utils/dimentions.dart';

class ResponsiveLayout extends StatelessWidget {
  static const String routeName = "/responsive-layout";
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;

  const ResponsiveLayout({
    Key? key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < webScreenSize) {
        return mobileScreenLayout;
      } else {
        return webScreenLayout;
      }
    });
  }
}
