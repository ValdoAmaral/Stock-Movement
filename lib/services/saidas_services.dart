


import 'package:flutter_application_stock/controllers/auth_controller.dart';
import 'package:http/http.dart' as http;


class SaidaServices {

 static var client = http.Client();

  static Future<String> setOut($ids,$nota,$quantidades,$ip,$peso) async {

    var map=Map<String,dynamic>();

    map['ids']=$ids;
    map['quantidades']=$quantidades;
    map['ip']=$ip;
    map['notas']=$nota;
    map['peso']=$peso;
    map['idarmazem']=AuthController.idarmazem;

    var url = Uri.parse('http://sonito.000webhostapp.com/apisgrd/AdminController/SetSaida');
    var response =await http.post(url,body:map );

    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      return(data);
    } else {
      return null;
    }

  }



}



