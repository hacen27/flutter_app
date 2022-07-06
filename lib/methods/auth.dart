import'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/methods/database.dart';
//import'package:flutter_application_2/methods/detabase.dart';

class Authent

{

  final FirebaseAuth auth = FirebaseAuth.instance;


  Future<User>  getCurrentUser() async{
    return await auth.currentUser!;
  }
  Future<void> createUserWithEmailAndPassword(String email, String password ,String phone,String nom) async{
    UserCredential userCredential =await auth.createUserWithEmailAndPassword(
        email: email, password: password
    );
    Map<String ,dynamic> userInfoMap ={
      "nom" : nom,
      "password" : password,
      "phone" :phone,
      "email" : email


    };

    if(userCredential != null){
      DatabaseMethods().addUserInfoToDB(auth.currentUser!.uid ,userInfoMap);

    }

  }


  Future<void> loginWithEmailAndPassword(String email, String password) async{
    UserCredential userCredential=
    await auth.signInWithEmailAndPassword(
        email: email,
        password: password

    );
  }

  Future<void> logout() async{
    await auth.signOut();
  }

}