
import 'package:flutter_application_stock/models/stock_model.dart';
import 'package:flutter_application_stock/services/stock_services.dart';
import 'package:get/get.dart';

class StockController extends GetxController {
  static var isLoading =false.obs;
  var stockList = List<StockModel>().obs;

  @override
  void onInit() {
    fetchfinaltodo();
    super.onInit();
  }

  void fetchfinaltodo() async {
    isLoading(true);
    try {
      var stocks = await StockServices.fetchStock();
      if (stocks != null) {
        // ignore: deprecated_member_use
        stockList.value = stocks;
      }
    } finally {
      isLoading(false);
    }
  }
}
