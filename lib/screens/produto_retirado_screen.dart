import 'package:flutter/material.dart';
import 'package:flutter_application_stock/controllers/saida_controller.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'package:flutter_application_stock/widgets/dialog_saida.dart';

class HistoriaScreen extends StatelessWidget {
  final SaidaController _controller = Get.put(SaidaController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAll(HomeScreen());
            },
          ),
          title: Text("Retiradas"),
          centerTitle: true),
      body: GetX<SaidaController>(
          init: Get.put<SaidaController>(SaidaController()),
          builder: (_controller) {
            print(_controller.saidaList.length);
            if (_controller.saidaList.length != null &&
                SaidaController.isLoading == false) {
              return ListView.builder(
                  itemCount: _controller.saidaList.length,
                  itemBuilder: (_, index) {
                    return Container(
                      height: 100,
                      child: Card(
                          child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Produto: " +
                                    _controller.saidaList[index].produto +
                                    "\n" +
                                    "Qty: " +
                                    _controller.saidaList[index].quantidade+" embalagens"),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Data: " +
                                    (_controller.saidaList[index].data == null
                                        ? ""
                                        : _controller.saidaList[index].data)),
                              ),
                              trailing: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            DialogDetalhesSaida("this.idS",
                                                _controller.saidaList[index].produto,
                                                _controller.saidaList[index].quantidade,
                                                "  this.observacao",
                                                _controller.saidaList[index].ip,
                                               " ",
                                                _controller.saidaList[index].peso,
                                                ""));
                                  }))),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)),
              );
            }
          }),
    ));
  }
}
