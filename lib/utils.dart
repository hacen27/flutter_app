//import 'dart:js';

import 'package:flutter/material.dart';
//final messengerkey =GlobalKey<ScaffoldMessengerState>();

class  Ulils {

  static showSnackBar( String? text){
    if(text == null) return;


    final snackBar =SnackBar(content: Text(text),backgroundColor: Colors.red);




  }
}

