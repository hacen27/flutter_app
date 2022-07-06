import 'package:flutter/cupertino.dart';
import 'package:date_time_field/date_time_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/profile_page.dart';
import 'package:flutter_application_2/pages/splash_screen.dart';
import 'package:flutter_application_2/pages/widgets/BusPage.dart';
import 'package:flutter_application_2/pages/widgets/header_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../common/theme_helper.dart';
import 'forgot_password_page.dart';
import 'forgot_password_verification_page.dart';
import 'registration_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  DateEditingController dateController = new DateEditingController();
  TextEditingController positionController = new TextEditingController();
  TextEditingController distinationController = new TextEditingController();

  // recupere les ville
  Future searchData() async {
    // Uri url = 'http://10.0.2.2/Bus_app/read.php' as Uri;
    // var response = await http.get(url);
    // return json.decode(response.body);
    var url = Uri.parse('http://10.0.3.2/Bus_app/recherch.php');
    http.post(url, body: {
      'date-dep': dateController.date.toString(),
      'garre_dep': positionController.text,
      'garre_arrive': distinationController.text,
    });
  }

  @override
  void initState() {
    super.initState();
    searchData();

    //  dateController.date = widget.list[widget.index]['fistname'];
    //  positionController.text = widget.list[widget.index]['lastname'];
    // distinationController.text = widget.list[widget.index]['phone'];
  }

  DateTime date = DateTime(2022, 12, 24);

  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

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
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).accentColor.withOpacity(0.5),
              ])),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "IL-RAHA_app",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.screen_lock_landscape_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  '-شاشة البداية',
                  style: TextStyle(
                      fontSize: 17, color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen(title: "Splash Screen")));
                },
              ),
              ListTile(
                leading: Icon(Icons.login_rounded,
                    size: _drawerIconSize,
                    color: Theme.of(context).accentColor),
                title: Text(
                  'صفحة تسجيل الدخول-login',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.person_add_alt_1,
                    size: _drawerIconSize,
                    color: Theme.of(context).accentColor),
                title: Text(
                  'Registration -صفحة التسجيل',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.password_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'profile',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.verified_user_sharp,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Verification Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordVerificationPage()),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Quitte-يغادر',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Image.asset('images/bus1.jpg', height: 100.0, width: 100.0),
                Center(
                  child: Text(
                    'Cherche un Yoyage',
                    // style: Theme.of(context).textTheme.title
                  ),
                ),
                SizedBox(height: 10.0),
                DateTimeField(
                  controller: dateController,
                  onChanged: (dt) {
                    setState(() => date = dt);
                    print('Selected date: $date');
                  },
                  decoration: InputDecoration(
                    labelText: 'Date',
                    icon: Icon(
                      Icons.calendar_today,
                      color: Color.fromARGB(255, 148, 131, 248),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: positionController,
                  decoration: InputDecoration(
                      labelText: 'Position', border: OutlineInputBorder()),
                  //   validator: (val) => val.isEmpty ? 'Entrez un nom' : null,
                  //   onChanged: (val) => nomComplet = val,
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: distinationController,
                  decoration: InputDecoration(
                      labelText: 'Distination', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15.0),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      searchData();
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BusPage()),
                    );
                  },
                  color: Color.fromARGB(255, 142, 149, 245),
                  child: Text('Cherch...',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
