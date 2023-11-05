import 'package:flutter/material.dart';

import 'screens/responsive/responsive_layout_screen.dart';
import 'screens/responsive/mobile_screen_layout.dart';
import 'screens/responsive/web_screen_layout.dart';

import 'screens/home_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/complete_user_info_screen.dart';

Map<String, Widget Function(BuildContext)> allRoutes(BuildContext context) {
  return {
    ResponsiveLayout.routeName: (context) => const ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout(),
        ),
    LoginScreen.routeName: (context) => const LoginScreen(),
    SignUpScreen.routeName: (context) => const SignUpScreen(),
    CompleteUserInfoScreen.routeName: (context) =>
        const CompleteUserInfoScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
  };
}
