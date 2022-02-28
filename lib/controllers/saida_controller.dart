
import 'package:flutter_application_stock/models/saida_model.dart';

import 'package:flutter_application_stock/services/saida_services2.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SaidaController extends GetxController {
  static var isLoading =false.obs;
  var saidaList = List<SaidaModel>().obs;
  var saidaList2 = List<SaidaModel>().obs;

  @override
  void onInit() {
    fetchfinaltodo();
    fetchfinaltodo2();
    super.onInit();
  }

  void fetchfinaltodo() async {
    isLoading(true);
    try {
      var saidas = await SaidaServices.getSaida();
      if (saidas != null) {
        // ignore: deprecated_member_use
        saidaList.value = saidas;
      }
    } finally {
      isLoading(false);
    }
  }
  void fetchfinaltodo2() async {
    isLoading(true);
    try {
      var saidas2 = await SaidaServices.getSaida2();
      if (saidas2 != null) {
        // ignore: deprecated_member_use
        saidaList2.value = saidas2;
      }
    } finally {
      isLoading(false);
    }
  }

}