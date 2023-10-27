import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/home_screen.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';

import 'screens/login_screen.dart';
import 'screens/complete_user_info_screen.dart';

Map<String, Widget Function(BuildContext)> allRoutes(BuildContext context) {
  return {
    LoginScreen.routeName: (context) => const LoginScreen(),
    SignUpScreen.routeName: (context) => const SignUpScreen(),
    CompleteUserInfoScreen.routeName: (context) =>
        const CompleteUserInfoScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
  };
}
