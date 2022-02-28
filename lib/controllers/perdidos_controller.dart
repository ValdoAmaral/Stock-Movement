
import 'package:flutter_application_stock/models/perdidos_model.dart';
import 'package:flutter_application_stock/models/saida_model.dart';
import 'package:flutter_application_stock/services/perdidos_services.dart';
import 'package:flutter_application_stock/services/saida_services2.dart';
import 'package:get/get.dart';


class PerdidosController extends GetxController {
  static var isLoading =false.obs;
  var perdasList = List<PerdidosModel>().obs;
  @override
  void onInit() {
    fetchfinaltodo();
    super.onInit();
  }
  void fetchfinaltodo() async {
    isLoading(true);
    try {
      var perdas = await PerdidosServices.getPerdas();
      if (perdas != null) {
        perdasList.value = perdas;
      }
    } finally {
      isLoading(false);
    }
  }

}