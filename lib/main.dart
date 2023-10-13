import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
import 'routes.dart';
import 'utils/theme_data.dart';

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
            home: const LoginScreen(),
            routes: allRoutes(context),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
