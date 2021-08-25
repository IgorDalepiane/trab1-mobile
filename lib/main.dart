import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trab1_mobile/screens/home_screen.dart';
import 'package:trab1_mobile/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Righteous'),
      home: LoginScreen(),
    );
  }
}
