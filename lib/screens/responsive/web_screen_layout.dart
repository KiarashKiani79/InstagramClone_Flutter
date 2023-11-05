import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/customs/custom_text.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitleText(
          text: "Instagram -",
          fontFamily: GoogleFonts.pacifico().fontFamily,
        ),
      ),
      body: const Center(
        child: Text("Web Screen Layout"),
      ),
    );
  }
}
