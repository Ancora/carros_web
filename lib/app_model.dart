import 'package:carrosweb/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  Widget page;

  AppModel() {
    page = HomePage();
  }

  setPage(Widget page) {
    this.page = page;
    notifyListeners();
  }
}
