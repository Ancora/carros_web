import 'package:carrosweb/imports.dart';
import 'package:firebase/firebase.dart' as fb;

void main() {
  _initFirebase();
  runApp(MyApp());
}

_initFirebase() {
  fb.initializeApp(
    apiKey: 'AIzaSyAzfMiADPN2sPoOl0rbdZ2w0SjOgjT9NWE',
    projectId: 'flutcars',
    databaseURL: 'https://flutcars.firebaseio.com',
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PagesModel(),
        )
      ],
      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme(context),
      home: LoginPage(), // pages/login/login_page.dart
    );
  }

  _theme(context) {
    AppModel app = AppModel.get(context, listen: true);
    bool admin = app.user == null || app.user.isAdmin();
    return admin ? _themeAdmin() : _themeUser();
  }

  _themeUser() {
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

  _themeAdmin() {
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
