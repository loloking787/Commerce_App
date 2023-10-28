import 'dart:async';
import 'package:e_commerece_error/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset('assets/images/splash.png',
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.fill,
      ),
    );
  }
}
