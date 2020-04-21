import 'package:carrosweb/pages/home_page.dart';
import 'package:flutter/material.dart';

class PageInfo {
  String title;
  Widget page;

  PageInfo(this.title, this.page);

  @override
  String toString() {
    return title;
  }
}

class AppModel extends ChangeNotifier {
  List<PageInfo> pages = [];
  PageInfo defaultPage = PageInfo('Home', HomePage());

  AppModel() {
    pages.add(defaultPage);
  }

  push(PageInfo page, {bool replace = false}) {
    if (replace) {
      popAll();
    }

    if (page.title != 'Home') {
      this.pages.add(page);
    }
    notifyListeners();
  }

  void pop() {
    this.pages.removeLast();
    notifyListeners();
  }

  void popAll() {
    this.pages.clear();
    pages.add(defaultPage);
    notifyListeners();
  }

  void popTo(int index) {
    pages.removeRange(index + 1, pages.length);
    notifyListeners();
  }
}
