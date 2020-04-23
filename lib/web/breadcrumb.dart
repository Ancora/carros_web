import 'package:carrosweb/app_model.dart';
import 'package:carrosweb/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BreadCrumb extends StatefulWidget {
  final Widget child;
  final List<Widget> actions;

  BreadCrumb({@required this.child, this.actions});

  @override
  _BreadCrumbState createState() => _BreadCrumbState();
}

class _BreadCrumbState extends State<BreadCrumb> {
  @override
  Widget build(BuildContext context) {
    PagesModel app = Provider.of<PagesModel>(context);

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.grey[100], // ????
//            width: size.width,
          height: 60,
          child: _listView(app),
        ),
        Expanded(
          child: widget.child,
        ),
      ],
    );
  }

  _listView(PagesModel app) {
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ListView.builder(
            itemCount: app.pages.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              PageInfo info = app.pages[index];

              return InkWell(
                onTap: () => _onClickPage(index),
                child: Row(
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(width: 32),
                      child: Icon(
                        index == 0
                            ? FontAwesomeIcons.home
                            : FontAwesomeIcons.chevronRight,
                        color: AppColors.texto,
                      ),
                    ),
                    Text(
                      info.title,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              );
            },
          ),
          // Actions na direita
          widget.actions != null
              ? Row(
                  children: widget.actions,
                )
              : Container()
        ],
      ),
    );
  }

  _onClickPage(int index) {
    PagesModel app = Provider.of<PagesModel>(context);

    if (index == 0) {
      app.popAll();
    } else {
      app.popTo(index);
    }
  }
/* class BreadCrumb extends StatefulWidget {
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
    AppModel app = Provider.of<AppModel>(context, listen: false);
    if (index == 0) {
      app.popAll();
    } else {
      app.popTo(index);
    }
  } */
}
