import 'package:carrosweb/app_model.dart';
import 'package:carrosweb/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _theme(),
        home: Home(),
      ),
    );
  }

  _theme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.blue[100],
      splashColor: Colors.blue,
      hoverColor: Colors.blue[100],
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}
