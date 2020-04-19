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
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blue[100],
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
