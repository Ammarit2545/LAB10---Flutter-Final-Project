import 'package:firebase_login/Screens/Welcome/welcome_screen.dart';
import 'package:firebase_login/screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: WelcomeScreen());
  }
}
