// ignore_for_file: control_flow_in_finally

import "dart:typed_data";

import "package:firebase_storage/firebase_storage.dart";

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> addImage(Uint8List file) async {
    String result = "error";
    try {
      final Reference reference = _storage.ref().child("paath").child("uid");
      UploadTask uploadTask = reference.putData(file);
      TaskSnapshot snapshot = await uploadTask;
      result = await snapshot.ref.getDownloadURL();
      result = "success";
    } catch (err) {
      result = "error";
    } finally {
      return result;
    }
  }



}
