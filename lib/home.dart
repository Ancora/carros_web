import 'package:carrosweb/colors.dart';
import 'package:carrosweb/constants.dart';
import 'package:carrosweb/web/body.dart';
import 'package:carrosweb/web/breadcrumb.dart';
import 'package:carrosweb/web/header.dart';
import 'package:carrosweb/web/menu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size get size => MediaQuery.of(context).size;
  bool get showMenu => true; // size.width > 500;

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
        color: AppColors.bg,
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
      child: Menu(),
      color: AppColors.bg,
    );
  }

  _right() {
    return Container(
      padding: EdgeInsets.all(8),
      width: showMenu ? size.width - menuWidth : size.width,
      child: Column(
        children: <Widget>[
          Container(
            width: size.width,
            height: 48,
            color: AppColors.bg,
            child: BreadCrumb(),
          ),
          Expanded(
            child: Body(),
          ),
        ],
      ),
    );
  }
}
