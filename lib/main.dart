import 'package:carrosweb/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme(),
      home: Home(),
    );
  }

  _theme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      //visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.blue,
      hoverColor: Colors.blue[100],
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
