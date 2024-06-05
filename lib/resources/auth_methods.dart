// ignore_for_file: empty_catches, prefer_final_fields, avoid_print, unnecessary_brace_in_string_interps

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";

class AuthMethods with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<bool> signInWIthGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print("google user Data is $googleUser");

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      print("auth credential is $credential");

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      print("user credential is $userCredential");

      User? user = userCredential.user;
      print("user credential is $userCredential");
      print(userCredential.additionalUserInfo!.isNewUser);

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _fireStore.collection("users").doc(user.uid).set({
            "username": user.displayName,
            "uid": user.uid,
            "profilePhoto": user.photoURL,
          });
        }
        print("successfully logged in through th goog account sign in method");
        res = true;
      }
    } catch (err, stackTrace){
      print(
          "catch error occured while login through the google account and the error is ${err}");
      print("stackTrace is $stackTrace");
      res = false;
    }
    return res;
  }
}
