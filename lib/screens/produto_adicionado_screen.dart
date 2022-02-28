import 'package:flutter/material.dart';
import 'package:flutter_application_stock/controllers/entrada_controller.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'package:flutter_application_stock/widgets/dialog_entrada.dart';

class ProdutoAdicionado extends StatelessWidget {
  final EntradaController _controller = Get.put(EntradaController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.offAll(HomeScreen());
                },
              ),
              title: Text("Entradas "),
              centerTitle: true),
          body: GetX<EntradaController>(
              init: Get.put<EntradaController>(EntradaController()),
              builder: (_controller) {
                if (_controller.entradaList.length != null && EntradaController.isLoading==false) {
                  return ListView.builder(

                      itemCount: _controller.entradaList.length,
                      itemBuilder: (_, index) {

                        print("AuthController.idarmazem");
                        return Container(
                          height: 100,
                          child: Card(
                              child: ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Produto: " +
                                        _controller.entradaList[index].produto +
                                        "\n" +
                                        "Qty: " +
                                        _controller.entradaList[index].quantidade+" embalagens"),
                                  ),
                                  subtitle:
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Data: " + (_controller.entradaList[index].data==null ? "":_controller.entradaList[index].data)),
                                  ),
                                  trailing:IconButton(icon: Icon(Icons.remove_red_eye_outlined,color: Colors.green,),
                                      onPressed: (){
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                DialogDetalhesAlert2("this.idS",
                                                   _controller.entradaList[index].produto,
                                                    _controller.entradaList[index].quantidade,
                                                    "  this.observacao",
                                                    "   this.perdas",
                                                    _controller.entradaList[index].peso,
                                                    "this.waybill",
                                                    _controller.entradaList[index].batchnr));

                                  })
                              )),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.green)
                    ),
                  );
                }
              }),
        )
    );
  }
}
