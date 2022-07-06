
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/common/theme_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../global/global.dart';
import '../main.dart';
import '../widgets/progress_dialog.dart';
import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
import'package:flutter_application_2/methods/auth.dart';

import 'widgets/header_widget.dart';
import '../methods/auth.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();



  validateForm() {


    if (!emailTextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg: "Emails non valide");
    }
    else if (passwordTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "passewod  is required ");
    }
    else
    {
      loginUserNow();

    }
  }

  loginUserNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(massage: "  patient s.v.p  .....");
        });
    final User? firebaseUser = (await fAuth
        .signInWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
        .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error  :" + msg.toString());
    }))
        .user;

    if (firebaseUser != null) {
      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "login est bien");

      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (c) =>  ProfilePage()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "login n'est  pas bien");
    }
  }



  final int datayAmount =500;

  double _headerHeight = 250;

  Key _formKey = GlobalKey<FormState>();
  var diskey =GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container( 
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'تسجيل الدخول',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 30.0),
                    Column(
                      children: [
                        Form(
                          key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                  child: TextField(
                                    controller: emailTextEditingController,

                                    decoration: ThemeHelper().textInputDecoration('Email', '-البريد الإلكتروني'),
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Container(

                                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                  child: TextField(
                                    controller: passwordTextEditingController,
                                    //_controller:password,
                                    obscureText: true,
                                    decoration: ThemeHelper().textInputDecoration('mot de passe', 'كلمه المرور '),
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10,0,10,20),
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                    },
                                    child: const Text( "Verifie vos compte", style: TextStyle( color: Colors.grey, ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: ThemeHelper().buttonBoxDecoration(context),
                                  child: ElevatedButton(
                                    style: ThemeHelper().buttonStyle(),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                      child: Text('Entrer'.toUpperCase(),
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                    ),
                                    onPressed: () async {
                                      validateForm();

                                      //var currentState;

                                      }
                                   // },
                                  ),
                                ),


                                Container(
                                  margin: EdgeInsets.fromLTRB(10,20,10,20),
                                  //child: Text('Don\'t have an account? Create'),
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(text: "vous n'avez pas de compte"),
                                        TextSpan(
                                          text: 'إنشاء الحساب',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                            },
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                        ),
                                      ]
                                    )
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );



  }


}
