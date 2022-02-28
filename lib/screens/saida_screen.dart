import 'package:flutter/material.dart';
import 'package:flutter_application_stock/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_stock/controllers/stock_controller.dart';
import 'package:flutter_application_stock/widgets/dialog_alert.dart';

class SaidaScreen extends StatelessWidget {
  List<TextEditingController> a = List<TextEditingController>(20).obs;
  List<String> lista = List<String>(20).obs;
  List<String> ids = List<String>();
  List<String> produtos = List<String>();
  List<String> qtbackup = List<String>();
  List<String> peso = List<String>(20).obs;
  List<String> batchNr = List<String>(20);
  String nota = '';
  String ip = '';

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
        title: Text("Retirar Produtos"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 300,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GetX<StockController>(
                        init: Get.put<StockController>(StockController()),
                        builder: (_controller) {
                          print(_controller.stockList.length);
                          if (_controller.stockList != null) {
                            return ListView.builder(
                                itemCount: _controller.stockList.length,
                                itemBuilder: (_, index) {
                                  ids.add(
                                      _controller.stockList[index].idproduto);
                                  qtbackup.add(
                                      _controller.stockList[index].quantidade);

                                  produtos
                                      .add(_controller.stockList[index].nome);

                                  return Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.red,
                                            offset: Offset(-1, -1),
                                            blurRadius: 1),
                                      ]),
                                      height: 240,
                                      child: Card(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 150,
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      controller:
                                                          TextEditingController(
                                                        text: "",
                                                      ),
                                                      onChanged: (txt) {
                                                        batchNr[index] = txt;
                                                      },
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText:
                                                            'Insira o batch nr',
                                                        labelText: 'Batch nr:',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: ClipRect(
                                                        child: Image.network(
                                                            _controller
                                                                .stockList[
                                                                    index]
                                                                .imagem),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text("Produto:" +
                                                      _controller
                                                          .stockList[index]
                                                          .nome),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 30.0),
                                                  child: Text(
                                                    "Qty:" +
                                                        _controller
                                                            .stockList[index]
                                                            .quantidade +
                                                        " T",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 100,
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      controller:
                                                          TextEditingController(
                                                        text: "",
                                                      ),
                                                      onChanged: (txt) {
                                                        lista[index] = txt;
                                                      },
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText:
                                                                  'Quantidade',
                                                              labelText:
                                                                  'Nr de embalagens',
                                                              labelStyle:
                                                                  TextStyle(
                                                                      fontSize:
                                                                          14)),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 3.0),
                                                  child: Container(
                                                    width: 100,
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      controller:
                                                          TextEditingController(
                                                        text: "",
                                                      ),
                                                      onChanged: (txt) {
                                                        peso[index] = txt;
                                                      },
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: 'Kg',
                                                        labelText:
                                                            'Peso unitario',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Obx(
                                                  () => Text(lista[index] ==
                                                              null ||
                                                          peso[index] == null ||
                                                          lista[index] == '' ||
                                                          peso[index] == ''
                                                      ? 'total'
                                                      : (((double.parse(lista[
                                                                      index]) *
                                                                  double.parse(
                                                                      peso[
                                                                          index]) /
                                                                  1000)))
                                                              .toString() +
                                                          "t"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ));
                                });
                          }
                          if (_controller.stockList == null) {
                            return CircularProgressIndicator();
                          } else {
                            return Container();
                          }
                        })),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  child: TextFormField(
                    cursorColor: Colors.red,
                    keyboardType: TextInputType.number,
                    onChanged: (txt) {
                      ip = txt;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Insira o nr Ip',
                      hintStyle: TextStyle(color: Colors.red),
                      labelText: 'Ip nr:',
                      labelStyle: TextStyle(color: Colors.red),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  child: TextFormField(
                    cursorColor: Colors.red,
                    onChanged: (txt) {
                      nota = txt;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Nota de saida',
                      hintStyle: TextStyle(color: Colors.red),
                      labelText: 'Observações',
                      labelStyle: TextStyle(color: Colors.red),
                      fillColor: Colors.red,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  child: TextFormField(
                    cursorColor: Colors.red,
                    onChanged: (txt) {

                    },
                    decoration: const InputDecoration(
                      hintText: 'Destino',
                      hintStyle: TextStyle(color: Colors.red),
                      labelText: 'Destino',
                      labelStyle: TextStyle(color: Colors.red),
                      fillColor: Colors.red,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            var bool = false;
            var b = false;
            var batchnr1 = "";
            var idS = "";
            var Qts = "";
            var pesot = "";
            var nomes = "";
            for (int i = 0; i < lista.length; i++) {
              if (lista[i] != null &&
                  ids[i] != null &&
                  peso[i] != null &&
                  lista[i] != '' &&
                  batchNr[i] != null) {
                Qts += lista[i] + ",";
                idS += ids[i] + ",";
                pesot += peso[i] + ",";
                batchnr1 += batchNr[i] + ",";
                nomes += produtos[i] + ",";
              } else {
                b = true;
              }
            }

            for (int i = 0; i < lista.length; i++) {
              if (lista[i] != null && lista[i] != '') {
                if (double.parse(qtbackup[i]) <
                    (double.parse(peso[i]) * double.parse(lista[i]) / 1000)) {
                  bool = true;
                } else {}
              }
            }

            if (Qts.length < 1 ||
                nota == '' ||
                ip == '' ||
                pesot == '' ||
                batchnr1 == '') {
              Get.snackbar("Valores invalidos", "Preencha todos os campos");
            } else if (bool == true ||
                nota == '' ||
                ip == '' ||
                pesot == '') {
              Get.snackbar("Valores invalidos",
                  "Valores inseridos sao maiores que o stock existente");
            } else {
              showDialog(
                  context: context,
                  builder: (context) =>
                      DialogAlert(idS, Qts, nota, pesot, ip, batchnr1, nomes));
            }
            bool = false;
            print(idS);
            print(Qts);
            print(nota);
            print(pesot);
            print(ip);
            print(nomes);
          },
          child: Icon(Icons.check)),
    ));
  }
}
