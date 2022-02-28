import 'package:flutter_application_stock/controllers/auth_controller.dart';
import 'package:flutter_application_stock/models/perdidos_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_stock/models/saida_model.dart';

  class PerdidosServices {

  static var client = http.Client();

  static Future<List<PerdidosModel>> getPerdas() async {
    var map=Map<String,dynamic>();
    map['id']=AuthController.idarmazem;
    var url = Uri.parse('https://www.seppa.co.mz/apisgrd/AdminController/getPerda');
    var response = await client.post(url,body: map);
    if (response.statusCode == 200) {
      var data = response.body;
      return PerdidosModel.toDoFromJson(data);
    } else {
      return null;
    }
  }
  static Future<List<PerdidosModel>> setPerdas() async {
    var map=Map<String,dynamic>();
    map['id']=AuthController.idarmazem;
    var url = Uri.parse('https://www.seppa.co.mz/apisgrd/AdminController/setPerda');
    var response = await client.post(url,body: map);
    if (response.statusCode == 200) {
      var data = response.body;
      return PerdidosModel.toDoFromJson(data);
    } else {
      return null;
    }
  }


}