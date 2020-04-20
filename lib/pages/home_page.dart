import 'package:carrosweb/web/debug_widget_size.dart';
//import 'package:carrosweb/web/web_utils.dart';
import 'package:flutter/material.dart';

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

  _body() {
    return DebugWidgetSize();
  }
}
