import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:login_app/login_screen.dart';
import 'package:login_app/sign_up.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new SignUpScreen()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 10);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),
              new Container(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: new CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
