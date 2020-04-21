import 'package:carrosweb/app_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BreadCrumb extends StatefulWidget {
  @override
  _BreadCrumbState createState() => _BreadCrumbState();
}

class _BreadCrumbState extends State<BreadCrumb> {
  @override
  Widget build(BuildContext context) {
    AppModel app = Provider.of<AppModel>(context);

    return ListView.builder(
      itemCount: app.pages.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        PageInfo info = app.pages[index];
        return InkWell(
          onTap: () => _onClickPage(index),
          child: Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.expand(width: 32),
                child: Icon(
                  index == 0
                      ? FontAwesomeIcons.home
                      : FontAwesomeIcons.angleRight,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                info.title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _onClickPage(int index) {
    AppModel app = Provider.of<AppModel>(context);
    if (index == 0) {
      app.popAll();
    } else {
      app.popTo(index);
    }
  }
}
