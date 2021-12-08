import 'package:flutter/material.dart';
import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:capstone_dicoding/pages/details/detailscreen.dart';
import 'package:capstone_dicoding/pages/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  void initState() {
    _scaffoldKey = new GlobalKey<ScaffoldState>();
    super.initState();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Timer(Duration(seconds: 4), () {
        Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => DetailScreen()));
      });
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => OnBoard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB983FF),
      key: _scaffoldKey,
      body: Center(
        child: Image.asset("assets/img/logo.png"),
      ),
    );
  }
}
