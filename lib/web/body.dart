import 'package:carrosweb/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PagesModel app = Provider.of<PagesModel>(context);
    PageInfo info = app.pages.last;
    return info.page;
  }
}
