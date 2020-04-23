import 'package:carrosweb/imports.dart';

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
      child: Header(),
    );
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
      color: AppColors.bg,
      child: Menu(),
    );
  }

  _right() {
    return Container(
      padding: EdgeInsets.all(8),
      width: showMenu ? size.width - menuWidth : size.width,
      child: Body(),
      /* child: Column(
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
      ), */
    );
  }
}
