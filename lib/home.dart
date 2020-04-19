import 'package:carrosweb/constants.dart';
import 'package:carrosweb/web/header.dart';
import 'package:carrosweb/web/menu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size get size => MediaQuery.of(context).size;
  bool get showMenu => size.width > 500;
  // bool get showDrawer => size.width <= 760;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _header(),
          _body(),
        ],
      ),
    );
  }

  _header() {
    return Container(
        padding: const EdgeInsets.all(16),
        width: size.width,
        height: headerHeight,
        color: Colors.blueGrey,
        child: Header());
  }

  _body() {
    return Container(
      width: size.width,
      height: size.height - headerHeight,
      child: showMenu
          ? Row(
              children: <Widget>[
                _menu(),
                _right(),
              ],
            )
          : _right(),
    );
  }

  _menu() {
    return Container(
      width: menuWidth,
      color: Colors.blue[100],
      child: Menu(),
    );
  }

  _right() {
    return Container(
      width: showMenu ? size.width - menuWidth : size.width,
      color: Colors.black45,
    );
  }
}
