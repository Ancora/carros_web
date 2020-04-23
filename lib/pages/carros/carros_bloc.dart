import 'package:carrosweb/imports.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  // lib\utils\bloc.dart
  Future<List<Carro>> fetch(context) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(context);
      add(carros);
      return carros;
    } catch (e) {
      addError(e);
    }
    return [];
  }
}
