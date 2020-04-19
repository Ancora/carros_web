import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size get size => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miniatura de Carros ${size.width} / ${size.height}'),
      ),
      body: _body(),
      drawer: Drawer(
        child: _menu(),
      ),
    );
  }

  _body() {
    return Row(
      children: <Widget>[
        _menu(),
        _right(),
      ],
    );
  }

  _menu() {
    return Container(
      width: 230,
      color: Colors.blue[100],
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Item 1'),
          ),
          ListTile(
            leading: Icon(Icons.star_border),
            title: Text('Item 2'),
          ),
          ListTile(
            leading: Icon(Icons.star_half),
            title: Text('Item 3'),
          ),
        ],
      ),
    );
  }

  _right() {
    return Container(
      width: size.width - 230,
      color: Colors.black45,
    );
  }
}
