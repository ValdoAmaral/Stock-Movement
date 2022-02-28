import 'package:flutter/material.dart';
import 'package:flutter_application_stock/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_stock/controllers/stock_controller.dart';

class HistoryScreen extends StatelessWidget {
  final StockController _controller = Get.put(StockController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.to(HomeScreen());
            },
          ),
          title: Text("Stock disponivel"),
          centerTitle: true,
        ),
        body: Container(
          height: 800,
          child: GetX<StockController>(
              init: Get.put<StockController>(StockController()),
              builder: (_controller) {
                if (_controller.stockList != null &&
                    StockController.isLoading == false) {
                  print(_controller.stockList.length);
                  return ListView.builder(
                    itemCount: _controller.stockList.length,
                    itemBuilder: (_, index) {
                      return Container(
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(180),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(-2, -1),
                                  blurRadius: 5),
                            ]),
                        child: Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  width: 130,
                                  child: Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                          _controller.stockList[index].imagem),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Nome: " +
                                          _controller.stockList[index].nome,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600]),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      "Categoria: " +
                                          _controller
                                              .stockList[index].categoria,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600]),
                                    ),
                                    SizedBox(height: 10.0),
                                  Expanded(
                                    child: Text(
                                      "Qty: " +
                                          _controller
                                              .stockList[index].quantidade +
                                          " Tonaledadas",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(

                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600]),
                                    )
                                  ),
                                    SizedBox(height: 10.0),
                                    Expanded(
                                        child: RaisedButton(
                                      onPressed: () {},
                                      child: Text("Ver Detalhes da qty",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                      color: Colors.green,
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.green)));
                }
              }),
        ),
      ),
    );
  }
}
//productController.produtos[index].imagem);
