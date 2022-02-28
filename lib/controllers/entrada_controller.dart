import 'package:flutter_application_stock/models/entrada_model.dart';
import 'package:flutter_application_stock/services/entrada_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EntradaController extends GetxController {
  static var isLoading =false.obs;
  var entradaList = List<EntradaModel>().obs;

  @override
  void onInit() {
    fetchfinaltodo();
    super.onInit();
  }

  void fetchfinaltodo() async {
    isLoading(true);
    try {
      var entradas = await EntradaServices.getEntrada();
      if (entradas != null) {
        // ignore: deprecated_member_use
        entradaList.value = entradas;
      }
    } finally {
      isLoading(false);
    }
  }

}