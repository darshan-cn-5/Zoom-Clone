// ignore_for_file: empty_catches, prefer_final_fields, avoid_print, unnecessary_brace_in_string_interps, unused_catch_stack, unnecessary_null_comparison, unnecessary_string_interpolations, unnecessary_nullable_for_final_variable_declarations, control_flow_in_finally, avoid_web_libraries_in_flutter, unused_import

import "dart:html";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";

class AuthMethods with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  Future<bool> signInWIthGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _fireStore.collection("users").doc(user.uid).set({
            "username": user.displayName,
            "uid": user.uid,
            "profilePhoto": user.photoURL,
          });
        }
        res = true;
      }
    } catch (err, stackTrace) {
      res = false;
    }
    return res;
  }

//   //  CRUD Methods

// //  1) Add

//   Future<String> addData(String email, String password) async{
//     String res = "error";
//     try {
//       if (email.isNotEmpty && password.isNotEmpty) {
//         await _fireStore.collection("users").doc("uid").set({
//           "email": email,
//           "password": password,
//         });
//         res = "success";
//       } else {
//         res = "error";
//       }
//     } catch (err) {
//       res = "error";
//     } finally {
//       return res;
//     }
//   }

//   // 2) Update

//   Future<String> updateData(String email, String password) async {
//     String res = "error";
//     try {
//       if (email.isNotEmpty && password.isNotEmpty) {
//         await _fireStore
//             .collection("users")
//             .doc("uid")
//             .update({"email": email});

//         res = "success";
//       } else {
//         res = "error";
//       }
//     } catch (err) {
//       res = "error";
//     } finally {
//       return res;
//     }
//   }

//   // 3) READ

//   Future<User> getData() async {
//     DocumentSnapshot snapshot =
//         await _fireStore.collection("users").doc(_auth.currentUser!.uid).get();
//     return snapshot.data() as User;
//   }

//   // 4) DELETE

//   Future<String> deleteData() async {
//     String res = "error";
//     try {
//       await _fireStore.collection("users").doc(_auth.currentUser!.uid).delete();
//       res = "success";
//     } catch (err) {
//       res = "error";
//     } finally {
//       return res;
//     }
//   }
}
