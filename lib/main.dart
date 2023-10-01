import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../utils/colors.dart';
import '../responsive/responsive_layout_screen.dart';
import 'responsive/mobile_screen_layout.dart';
import 'responsive/web_screen_layout.dart';

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
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: mobileBackgroundColor,
        primaryColor: primaryColor,
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
