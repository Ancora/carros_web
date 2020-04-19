import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Miniatura de Carros ${size.width} / ${size.height}'),
      ),
      body: _body(),
    );
  }

  _body() {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: <Widget>[
        Container(
          width: 230,
          color: Colors.blue[100],
        ),
        Container(
          width: size.width - 230,
          color: Colors.black45,
        ),
      ],
    );
  }
}
