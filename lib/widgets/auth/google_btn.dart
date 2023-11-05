import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import '../../services/loading_manager.dart';
import '/widgets/customs/custom_buttons.dart';
import 'package:ionicons/ionicons.dart';

import '../../screens/responsive/responsive_layout_screen.dart';
import '../../services/dialogs.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({super.key});

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool isLoading = false;
  Future<void> _signInWithGoogle({required BuildContext context}) async {
    setState(() {
      isLoading = true;
    });
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Save user data to firestore
      if (userCredential.additionalUserInfo!.isNewUser) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          // 'userId': userCredential.user!.uid,
          'username': userCredential.user!.displayName,
          'email': userCredential.user!.email,
          'photoUrl': userCredential.user!.photoURL,
          "bio": "",
          "followers": [],
          "following": [],
          // 'createdAt': Timestamp.now(),
        });
      }
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.pushReplacementNamed(context, ResponsiveLayout.routeName);
      });
      if (!mounted) return;
      Dialogs.toastSuccess(
        msg: "Logged in successfully!",
        context: context,
      );
    } on FirebaseException catch (error) {
      await Dialogs.error(
        context: context,
        subtitle: error.message.toString(),
      );
    } catch (error) {
      await Dialogs.error(
        context: context,
        subtitle: error.toString(),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingManager(
      isLoading: isLoading,
      child: MyOutlinedButton(
        text: "Sign in with Google",
        seedColor: Theme.of(context).colorScheme.secondary,
        width: double.infinity,
        hasIcon: true,
        iconData: Ionicons.logo_google,
        onPressed: () async {
          isLoading ? null : await _signInWithGoogle(context: context);
        },
      ),
    );
  }
}
