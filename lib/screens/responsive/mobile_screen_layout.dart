import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_flutter/widgets/customs/custom_loading_indicator.dart';

import '../../widgets/customs/custom_text.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

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
        child: CustomLoadingIndicator(),
      ),
    );
  }
}
