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
        title: Text('Miniatura de Carros'),
      ),
      body: Center(
        child: Text('Hello ${size.width} / ${size.height}!!!'),
      ),
    );
  }
}
