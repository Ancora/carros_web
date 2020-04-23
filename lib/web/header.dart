import 'package:carrosweb/app_model.dart';
import 'package:carrosweb/imports.dart';
import 'package:carrosweb/pages/login/usuario.dart';
import 'package:carrosweb/pages/senha/alterar_senha_page.dart';
import 'package:carrosweb/pages/usuarios/meus_dados_page.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  GlobalKey _menuState = GlobalKey();
  Size get size => MediaQuery.of(context).size;
  Usuario get user => AppModel.get(context).user;

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
          '${user?.nome}',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
          ),
        ),
        SizedBox(width: 20),
        InkWell(
          child: CircleAvatar(
            backgroundImage: NetworkImage('${user?.urlFoto}'),
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
    if ('logout' == value) {
      logout(context);
    } else if ('meus_dados' == value) {
      Usuario user = AppModel.get(context).user;
      PagesModel.get(context).push(PageInfo("Meus Dados", MeusDadosPage(user)));
    } else if ('alterar_senha' == value) {
      PagesModel.get(context)
          .push(PageInfo("Alterar Senha", AlterarSenhaPage()));
    } else {}
  }
}
