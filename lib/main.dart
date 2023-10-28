import 'package:e_commerece_error/styles/app_theme.dart';
import 'package:e_commerece_error/ui/login/login_screen.dart';
import 'package:e_commerece_error/ui/register/register_screen.dart';
import 'package:e_commerece_error/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        },
      theme: MyTheme.lightTheme,
    );
  }

}