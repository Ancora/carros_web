import 'package:carrosweb/imports.dart';

class CarroPage extends StatelessWidget {
  final Carro car;
  CarroPage(this.car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(car.nome ?? ''),
        actions: [
          IconButton(
            icon: Icon(Icons.place),
            onPressed: () => _onClickMapa(context),
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () => _onClickVideo(context),
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          car.urlFoto != null
              ? Image.network(car.urlFoto)
              : FlutterLogo(
                  size: 100,
                )
        ],
      ),
    );
  }

  void _onClickMapa(context) {
    if (car.latitude != null && car.longitude != null) {
      launch(// web\utils\web.dart
          "https://www.google.com/maps/@${car.latitude},${car.longitude},19z");
    } else {
      alert(context, "Este carro não possui Lat/Lng da fábrica.");
    }
  }

  void _onClickVideo(context) {
    if (car.urlVideo != null && car.urlVideo.isNotEmpty) {
      launch(car.urlVideo);
    } else {
      alert(context, "Este carro não possui nenhum vídeo");
    }
  }
}

/* class CarroPage extends StatefulWidget {
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
 */
