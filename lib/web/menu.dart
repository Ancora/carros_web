import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}
