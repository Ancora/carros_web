import 'package:carrosweb/imports.dart';
import 'package:carrosweb/pages/carros/carros_list.dart';

class CarrosPage extends StatefulWidget {
  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage> {
  Usuario get user => AppModel.get(context).user; // lib\pages\login\usuario.dart

  @override
  Widget build(BuildContext context) {
    return user.isAdmin() ? _admin() : _user();
  }

  _user() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => logout(context),
          )
        ],
      ),
      body: CarrosListView(),
    );
  }

  _admin() {
    return Scaffold(
      body: BreadCrumb(
        child: CarrosListView(),
        actions: [
          AddButton(
            onPressed: _onClickAdd,
          )
        ],
      ),
    );
  }

  // Adicionar novo carro
  _onClickAdd() {
    PagesModel.get(context).push(PageInfo("Carros", CarroFormPage()));
  }

/* class _CarrosPageState extends State<CarrosPage> {
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
        },
      ),
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
              constraints.maxWidth * 0.05,
              min: 5,
              max: Theme.of(context).textTheme.bodyText1.fontSize,
            );

            Carro car = carros[index];

            return InkWell(
              onTap: () => _onClickCarro(car),
              child: Card(
                color: AppColors.bg,
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
                      style: TextStyle(
                        fontSize: fontSize,
                        color: AppColors.texto,
                      ),
                    ),
                    Text(
                      car.tipo ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.texto),
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
    app.push(PageInfo(car.nome, CarroPage(car)));
  } */
}
