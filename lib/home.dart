import 'package:carrosweb/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size get size => MediaQuery.of(context).size;
  bool get showDrawer => size.width <= 760;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miniatura de Carros ${size.width} / ${size.height}'),
        automaticallyImplyLeading: showDrawer,
      ),
      body: _body(),
      drawer: Drawer(
        child: _menu(),
      ),
    );
  }

  _body() {
    return showDrawer
        ? _right()
        : Row(
            children: <Widget>[
              _menu(),
              _right(),
            ],
          );
  }

  _menu() {
    return Container(
      width: menuWidth,
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
      width: showDrawer ? size.width : size.width - menuWidth,
      color: Colors.black45,
    );
  }
}
