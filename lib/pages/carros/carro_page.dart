import 'package:carrosweb/pages/carros/carro.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  final Carro car;
  CarroPage(this.car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.nome),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            car.urlFoto ??
                'https://cdn.pixabay.com/photo/2013/04/01/11/00/no-driving-98886_960_720.png',
          ),
          Text(
            car.nome ?? '',
            overflow: TextOverflow.ellipsis,
            //style: TextStyle(fontSize: fontSize),
          ),
          Text(
            car.tipo ?? '',
            overflow: TextOverflow.ellipsis,
            //style: TextStyle(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
