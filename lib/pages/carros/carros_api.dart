import 'dart:convert' as convert;
import 'package:carrosweb/imports.dart';
import 'package:carrosweb/utils/http_helper.dart' as http;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(context, {String tipo}) async {
    String url = "$BASE_URL/carros";

    if (tipo != null) {
      url += '/tipo/$tipo';
    }

    final response = await http.get(context, url); // utils/http_helper.dart
    String json = response.body;

    List list = convert.json.decode(json);

    List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }

  static Future<ApiResponse> save(context, Carro car) async {
    try {
      String url = "$BASE_URL/carros";
      String json = car.toJson();

      final response = await http.post(context, url, body: json);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map mapResponse = convert.json.decode(response.body);
        Carro carro = Carro.fromMap(mapResponse);
        print("Carro salvo: ${carro.id}");
        return ApiResponse.ok();
      }

      Map mapResponse = convert.json.decode(response.body);
      return ApiResponse.error(msg: mapResponse["error"]);
    } catch (e) {
      print(e);
      return ApiResponse.error(msg: "Não foi possível salvar o carro");
    }
  }

  static Future<ApiResponse> delete(context, Carro car) async {
    try {
      String url = "$BASE_URL/carros/${car.id}";
      var response = await http.delete(context, url);

      if (response.statusCode == 200) {
        Map mapResponse = convert.json.decode(response.body);
        return ApiResponse.ok(msg: mapResponse["msg"]);
      }
    } catch (e) {
      print(e);
    }
    return ApiResponse.error(msg: "Não foi possível deletar o carro");
  }
}
