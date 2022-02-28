import 'package:http/http.dart' as http;
import 'package:flutter_application_stock/controllers/auth_controller.dart';
import 'package:flutter_application_stock/models/entrada_model.dart';

class EntradaServices{
  static var client = http.Client();

  static Future<List<EntradaModel>> getEntrada() async {
    var map=Map<String,dynamic>();
    map['id']=AuthController.idarmazem;
    var url = Uri.parse('http://www.seppa.co.mz/apisgrd/AdminController/getEntrada');
    var response = await client.post(url,body: map);
    if (response.statusCode == 200) {
      var data = response.body;
      return EntradaModel.toDoFromJson(data);
    } else {
      return null;
    }
  }

}