import 'package:carrosweb/colors.dart';
import 'package:carrosweb/domain/user.dart';
import 'package:carrosweb/utils/alert.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  GlobalKey _menuState = GlobalKey();
  Size get size => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FlutterLogo(
        size: 50,
      ),
      title: Text(
        'Miniatura de Carros',
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
          color: Theme.of(context).primaryColor,
        ),
      ),
      trailing: _right(),
    );
  }

  _right() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          user.nome,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
          ),
        ),
        SizedBox(width: 20),
        InkWell(
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.urlFoto),
          ),
          onTap: () {
            // abre o popup menu
            dynamic state = _menuState.currentState;
            state.showButtonMenu();
          },
        ),
        PopupMenuButton<String>(
          color: AppColors.bg,
          key: _menuState,
          padding: EdgeInsets.zero,
          onSelected: (value) {
            _onClickOptionMenu(context, value);
          },
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 28,
            color: Theme.of(context).primaryColor,
          ),
          itemBuilder: (context) => _getActions(),
        ),
      ],
    );
  }

  _getActions() {
    return <PopupMenuItem<String>>[
      PopupMenuItem<String>(
        value: 'meus_dados',
        child: Text(
          'Meus dados',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      PopupMenuItem<String>(
        value: 'alterar_senha',
        child: Text(
          'Alterar senha',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      PopupMenuItem<String>(
        value: 'logout',
        child: Text(
          'Logout',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ];
  }

  void _onClickOptionMenu(context, String value) {
    print('_onClickOptionMenu $value');
    if ('logout' == value) {
    } else if ('meus_dados' == value) {
    } else if ('alterar_senha' == value) {
    } else {}
    alert(context, value);
  }
}
