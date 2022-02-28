import 'package:flutter_application_stock/controllers/auth_controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_stock/models/saida_model.dart';

class SaidaServices {

  static var client = http.Client();

  static Future<List<SaidaModel>> getSaida() async {

    var map=Map<String,dynamic>();
    map['id']=AuthController.idarmazem;
    var url = Uri.parse('https://www.seppa.co.mz/apisgrd/AdminController/getSaida');
    var response = await client.post(url,body: map);

    if (response.statusCode == 200) {
      var data = response.body;
      return SaidaModel.toDoFromJson(data);
    } else {
      return null;
    }
  }
  static Future<List<SaidaModel>> getSaida2() async {
    var map = Map<String, dynamic>();
    map['id'] = AuthController.idarmazem;
    var url = Uri.parse(
        'https://www.seppa.co.mz/apisgrd/AdminController/getSaidaDevolucao');
    var response = await client.post(url, body: map);

    if (response.statusCode == 200) {
      var data = response.body;
      return SaidaModel.toDoFromJson(data);
    } else {
      return null;
    }
  }

}