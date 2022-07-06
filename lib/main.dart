import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_2/auth_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/profile_page.dart';
//import 'package:flutter_application_2/pages/Utils.dart';
import 'package:flutter_application_2/pages/registration_page.dart';
import 'package:hexcolor/hexcolor.dart';

import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginUiApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = HexColor('#0839fe');
  Color _accentColor = HexColor('#f2f5ff');

  static final String title = 'setup Firebase';

  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    //var Utils;

    return MaterialApp(
      //scaffoldMessengerKey:Utils.messengerkey,
      navigatorKey: navigatorKey,
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('il ya une erreur'));
            } else if (snapshot.hasData) {
              return ProfilePage();
            } else {
              return LoginPage();
            }
          },
        ),
      );
}
