import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/screens/responsive/responsive_layout_screen.dart';
import 'package:instagram_flutter/screens/responsive/web_screen_layout.dart';
import 'package:instagram_flutter/widgets/customs/custom_text.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes.dart';
import '/screens/auth/login_screen.dart';
import 'utils/theme_data.dart';
import 'widgets/customs/custom_loading_indicator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDwxUFvUzUU7lghNM0wRNbwKpVyfkaPH9M",
        appId: "1:655194227975:web:541c938366f8dee226f1a2",
        messagingSenderId: "655194227975",
        projectId: "instagram-flutter-c0018",
        storageBucket: "instagram-flutter-c0018.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        }),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Instagram -',
            theme: customThemeData(isDarkTheme: true, context: context),
            debugShowCheckedModeBanner: false,
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const ResponsiveLayout(
                      mobileScreenLayout: MobileScreenLayout(),
                      webScreenLayout: WebScreenLayout(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: MyTitleText(text: "${snapshot.error}"),
                    );
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CustomLoadingIndicator(),
                  );
                }
                return const LoginScreen();
              },
            ),
            routes: allRoutes(context),
          );
        },
      ),
    );
  }
}
