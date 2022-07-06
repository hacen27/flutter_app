import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/modele/user.dart';

class DatabaseMethods{
  Future addUserInfoToDB ( String userId ,Map<String, dynamic> userInfoMap){
    return FirebaseFirestore.instance
        .collection("user")
        .doc(userId)
        .set(userInfoMap);
  }
  Future<DocumentSnapshot> getUserFromDB(String userId) {
    return FirebaseFirestore.instance.collection("user").doc(userId).get();

  }
}