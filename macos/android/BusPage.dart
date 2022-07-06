import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_time_field/date_time_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/profile_page.dart';
import 'package:flutter_application_2/pages/splash_screen.dart';
import 'package:flutter_application_2/pages/widgets/header_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import '../common/theme_helper.dart';
// import 'forgot_password_page.dart';
// import 'forgot_password_verification_page.dart';
// import 'registration_page.dart';

class BusPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BusPageState();
  }
}

class _BusPageState extends State<BusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    'Listes des bus Voyages',
                    // style: Theme.of(context).textTheme.title
                  ),
                ),
                SizedBox(height: 15.0),
                Image.asset('images/bus1.jpg', height: 100.0, width: 100.0),
                SizedBox(height: 15.0),
                Image.asset('images/bus-white_161488-534.jpg',
                    height: 100.0, width: 100.0),
                SizedBox(height: 15.0),
                Image.asset('images/bus_PNG101199.png',
                    height: 100.0, width: 100.0),
                SizedBox(height: 15.0),
                Image.asset('images/citaro_zephir902.jpg',
                    height: 100.0, width: 100.0),
                SizedBox(height: 15.0),
                Image.asset(
                    'images/stm-centre-transport-legendre-bus-photo-P.-Rachiele-066-scaled.jpg',
                    height: 100.0,
                    width: 100.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
