import 'package:carrosweb/app_model.dart';
import 'package:carrosweb/pages/carros/carro.dart';
import 'package:carrosweb/pages/carros/carro_page.dart';
import 'package:carrosweb/pages/carros/carros_api.dart';
//import 'package:carrosweb/utils/nav.dart';
import 'package:carrosweb/web/web_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrosPage extends StatefulWidget {
  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Carro>>(
          future: CarrosApi.getCarros(context),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<Carro> carros = snapshot.data;
            return _listView(carros);
          }),
    );
  }

  _listView(List<Carro> carros) {
    return GridView.builder(
      itemCount: carros.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = size(
              constraints.maxWidth * 0.1,
              min: 10,
              max: Theme.of(context).textTheme.bodyText1.fontSize,
            );

            Carro car = carros[index];

            return InkWell(
              onTap: () => _onClickCarro(car),
              child: Card(
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
                      style: TextStyle(fontSize: fontSize),
                    ),
                    Text(
                      car.tipo ?? '',
                      overflow: TextOverflow.ellipsis,
                      //style: TextStyle(fontSize: fontSize),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  _onClickCarro(Carro car) {
    //push(context, CarroPage(car));
    AppModel app = Provider.of<AppModel>(context, listen: false);
    app.push(CarroPage(car));
  }
}
