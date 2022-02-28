import 'package:flutter/material.dart';
import 'package:flutter_application_stock/controllers/stock_controller.dart';
import 'package:flutter_application_stock/screens/home_screen.dart';
import 'package:flutter_application_stock/widgets/dialog_alert2.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';


class TesteScreen extends StatelessWidget {
  List<TextEditingController> a = List<TextEditingController>(20);
  List<String> lista = List<String>(20).obs;
  List<String> ids = List<String>();
  List<String> qtbackup = List<String>();
  List<String> perdas = List<String>(20);
  List<String> peso = List<String>(20).obs;
  List<String> batchNr = List<String>(20);
  List<String> total = List<String>(20);
  String waybill = "";
  String observacoes = "";

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
        title: Text("Adicionar Produtos"),
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
                          color: Colors.green,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: GetX<StockController>(
                          init: Get.put<StockController>(StockController()),
                          builder: (_controller) {
                            if (_controller.stockList != null) {
                              return ListView.builder(
                                  itemCount: _controller.stockList.length,
                                  itemBuilder: (_, index) {
                                    ids.add(
                                        _controller.stockList[index].idproduto);
                                    qtbackup.add(_controller
                                        .stockList[index].quantidade);
                                    return Container(
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                              color: Colors.green,
                                              offset: Offset(-1, -1),
                                              blurRadius: 1),
                                        ]),
                                        height:222,
                                        child: Card(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width: 150,
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
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
                                                          labelText:
                                                              'Batch nr:',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child:Expanded(
                                                      child: Container(
                                                        height:59,
                                                        width: 100,
                                                        child: ClipRect(
                                                          child: Image.network(_controller
                                                              .stockList[index]
                                                              .imagem),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                  Text("Qty:" +
                                                      _controller
                                                          .stockList[index]
                                                          .quantidade+" t"),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Container(
                                                      width: 80,
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        controller:
                                                            TextEditingController(
                                                          text: "",
                                                        ),
                                                        onChanged: (txt) {
                                                          perdas[index] = txt;
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          hintText:
                                                              'Kg',
                                                          labelText: 'Perdas',
                                                        ),
                                                      ),
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
                                                        const EdgeInsets.only(
                                                            bottom: 1.0),
                                                    child: Container(
                                                      width: 100,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left:8.0),
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
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
                                                                  labelText: 'Nr de embalagens',labelStyle: TextStyle(fontSize: 14)
                                                          ),
                                                        ),
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
                                                            TextInputType
                                                                .number,
                                                        controller:
                                                            TextEditingController(
                                                          text: "",
                                                        ),
                                                        onChanged: (txt) {
                                                          peso[index] = txt;
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                              hintText:
                                                              'Kg',
                                                              labelText: 'Peso unitario',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Obx(()=>
                                                      Text(lista[index]==null || peso[index]==null || lista[index]=='' || peso[index]==''?'total':(((double.parse(lista[index])*double.parse(peso[index])/1000))).toString()+"t"
                                                      ),),
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
                          }))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  child: TextFormField(
                    controller:
                    TextEditingController(
                      text: "",
                    ),
                    onChanged: (txt) {
                     waybill= txt;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Insira o nr de waybill',
                      labelText: 'Waybill',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  child: TextFormField(
                   controller: TextEditingController(
                      text: "",
                    ),
                    onChanged: (txt) {
                     observacoes= txt;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Nota de entrada',
                      labelText: 'Observações',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            var bool = false;
            var boolqty = false;
            var idS = "";
            var Qts = "";
            var perdass = "";
            var pesos = "";
            var bnr = "";
            var b = false;

            for (int i = 0; i < lista.length; i++) {
              if (lista[i] != null && lista[i] != '') {
                if (peso[i] != '' &&
                    perdas[i] != '' &&
                    batchNr[i] != '' &&
                    peso[i] != null &&
                    perdas[i] != null &&
                    batchNr[i] != null) {
                  Qts += lista[i] + ",";
                  idS += ids[i] + ",";
                  pesos += peso[i] + ",";
                  perdass += perdas[i] + ",";
                  bnr += batchNr[i] + ",";
                } else {
                  bool = true;
                }
              } else {}
            }
            for (int i = 0; i < lista.length; i++) {
              if (lista[i] != null && lista[i] != '') {
                if (double.parse(qtbackup[i]) < double.parse(lista[i])) {
                  boolqty = true;
                } else {}
              }
            }

            if (bool == true || Qts.length < 1 || observacoes=='' || waybill=='' || bnr=='') {
              Get.snackbar("Valores invalidos", "Preencha todos os campos");
            } //else if (boolqty == true || observacoes=='' || waybill=='') {

             else {

               showDialog(
                  context: context,
                  builder: (context) => DialogAlert2(idS, Qts,observacoes,perdass,pesos,waybill,bnr));

            }

            bool = false;
            boolqty = false;
            print(pesos);
            print(bnr);
            print(Qts);
            print(observacoes);
            print(waybill);

          },
          child: Icon(Icons.check)),
    ));
  }
}
