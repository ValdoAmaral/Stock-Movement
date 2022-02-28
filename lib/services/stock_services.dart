import 'package:flutter_application_stock/controllers/auth_controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_stock/models/stock_model.dart';

class StockServices {

 static var client=http.Client();
 
 static Future<List<StockModel>> fetchStock() async{
  var map=Map<String,dynamic>();
  map['id']=AuthController.idarmazem;
  var url = Uri.parse('https://www.seppa.co.mz/apisgrd/AdminController/getStock');
//  var response =await http.post();

  var response =await http.post(url,body:map );
  print(response.statusCode.toString()+"xxxxxxxxxxxx");


      if(response.statusCode==200){
      var jsonString=response.body;
      return StockModelFromJson(jsonString);
  }

}

} 
