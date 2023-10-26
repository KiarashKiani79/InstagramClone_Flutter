import 'package:flutter/services.dart';
// Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final User? _user = FirebaseAuth.instance.currentUser;

  // Adding Image to Firebase Storage
  Future<String> uploadImageToStorage({
    required String childName,
    required Uint8List file,
    bool isProfile = false,
  }) async {
    Reference ref = _storage.ref().child(childName).child(_user!.uid);

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
