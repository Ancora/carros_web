import 'package:carrosweb/app_model.dart';
import 'package:carrosweb/pages/carros/carro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarroPage extends StatefulWidget {
  final Carro car;
  CarroPage(this.car);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            widget.car.urlFoto ??
                'https://cdn.pixabay.com/photo/2013/04/01/11/00/no-driving-98886_960_720.png',
          ),
          Text(
            widget.car.nome ?? '',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
            ),
          ),
          Text(
            widget.car.tipo ?? '',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
            ),
          ),
          RaisedButton(
            child: Text('Voltar'),
            onPressed: _onClickVoltar,
          ),
        ],
      ),
    );
  }

  void _onClickVoltar() {
    AppModel app = Provider.of<AppModel>(context, listen: false);
    app.pop();
  }
}
