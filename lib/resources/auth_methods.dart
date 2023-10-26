import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:instagram_flutter/resources/storage_methods.dart";

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");

// *Sign-in* with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      rethrow;
    }
  }

// *Register* with email and password
  Future<void> registerWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required String bio,
    required Uint8List profilePhoto,
  }) async {
    try {
// Register User with email and password
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

// Uid of the user
      final String uid = userCred.user!.uid;

// Upload profile photo to firebase storage
      final String photoUrl = await StorageMethods().uploadImageToStorage(
        childName: "profilePics",
        file: profilePhoto,
        isProfile: true,
      );

// Add user data to firestore
      await _userCollection.doc(uid).set(
        {
          "username": username,
          "email": email,
          "bio": bio,
          "photoUrl": photoUrl,
          "followers": [],
          "following": [],
        },
      );

      // DocumentSnapshot userDoc =
      //     await _userCollection.doc(uid).get();
      // print(userDoc.data());
    } on FirebaseAuthException catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  // reset password
  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
