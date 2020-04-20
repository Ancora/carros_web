import 'package:carrosweb/app_model.dart';
import 'package:carrosweb/pages/carros_page.dart';
import 'package:carrosweb/pages/home_page.dart';
import 'package:carrosweb/pages/usuarios_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String selected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _itemMenu('Home', FontAwesomeIcons.home, HomePage()),
        _itemMenu('Carros', FontAwesomeIcons.car, CarrosPage()),
        _itemMenu('Usuários', FontAwesomeIcons.userAlt, UsuariosPage()),
      ],
    );
  }

  _itemMenu(String title, IconData icon, Widget page) {
    bool b = title == selected;

    return Material(
      color: b ? Theme.of(context).hoverColor : Colors.transparent,
      child: InkWell(
        onTap: () {
          AppModel app = Provider.of<AppModel>(context, listen: false);
          app.setPage(page);
          setState(() {
            this.selected = title;
          });
        },
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: b ? FontWeight.bold : FontWeight.normal,
              fontSize: b ? 20 : 18,
              color: b ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
