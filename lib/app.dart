import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/splash.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {'/': (context) => SplashScreen()},
    );
  }
}
