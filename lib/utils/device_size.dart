import 'package:flutter/material.dart';

class Device {
  final BuildContext context;

  Device(this.context);

  // Get the width of the screen in logical pixels.
  double get screenWidth => MediaQuery.of(context).size.width;

  // Get the height of the screen in logical pixels.
  double get screenHeight => MediaQuery.of(context).size.height;

  // Get the height of the device's status bar in logical pixels.
  double get statusBarHeight => MediaQuery.of(context).padding.top;

  // Get the height of the bottom navigation bar in logical pixels.
  static double get bottomNavBarHeight => kBottomNavigationBarHeight;

  double get bodyHeight => (screenHeight - statusBarHeight - appBarHeight);

  // Get the current text scaling factor for accessibility.
  double get textScaleFactor => MediaQuery.of(context).textScaleFactor;

  // Get the device pixel ratio (for example, 2.0 for a high-density screen).
  double get devicePixelRatio => MediaQuery.of(context).devicePixelRatio;

  // Get the height of the standard app bar.
  static double get appBarHeight => kToolbarHeight;

  // Get the height of the soft keyboard when it's visible.
  double get keyboardHeight => MediaQuery.of(context).viewInsets.bottom;

  // Check if the device is in landscape orientation.
  bool get isLandscape =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  // Get the left inset for system gestures (notch on some devices).
  double get systemGestureInsets =>
      MediaQuery.of(context).systemGestureInsets.left;

  // Get the top safe area padding (above the status bar).
  double get topSafeArea => MediaQuery.of(context).padding.top;

  // Get the bottom safe area padding (below the navigation bar).
  double get bottomSafeArea => MediaQuery.of(context).padding.bottom;

  // Get the bottom padding of the app bar (if any).
  double get appBarBottomPadding => MediaQuery.of(context).padding.bottom;

  // Get the top padding of the app bar (if any).
  double get appBarTopPadding => MediaQuery.of(context).padding.top;

  // Check if the device has a notch (status bar padding > 24).
  bool get hasNotch => MediaQuery.of(context).padding.top > 24;

  // More dynamic properties for common design and layout values.
  static double get buttonHeight => 48.0; // Typical button height
  static double get cardElevation => 2.0; // Elevation for Material cards
  static double get standardSpacing => 16.0; // Standard spacing between widgets
  static double get largeTextSize => 24.0; // Font size for large text
  static double get mediumTextSize => 18.0; // Font size for medium text
  static double get smallTextSize => 14.0; // Font size for small text
  static double get borderRadius => 8.0; // Standard border radius

  // You can add even more dynamic properties as needed for your app's styling and layout.
}
