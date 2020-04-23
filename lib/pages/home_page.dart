import 'package:carrosweb/imports.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  /* _body() {
    return DebugWidgetSize();
  } */
  _body() {
    return Center(
      child: Container(
        width: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Carros",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/imgs/background.jpg",
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
