import 'package:carrosweb/app_model.dart';
import 'package:carrosweb/colors.dart';
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
      fontFamily: 'IndieFlower',
      //fontFamily: 'ComicNeue',
      primarySwatch: Colors.blue,
      primaryColor: AppColors.texto,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor:
          Colors.lightBlueAccent[100], // cor padrão de fundo
      splashColor: Colors.blue,
      hoverColor: Colors.lightBlueAccent[100],
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 22,
        ),
        bodyText2: TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}
