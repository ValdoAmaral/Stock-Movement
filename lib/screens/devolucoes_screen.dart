import 'package:flutter/material.dart';
import 'package:flutter_application_stock/controllers/saida_controller.dart';
import 'package:flutter_application_stock/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_stock/widgets/dialog_alert_devolucoes.dart';

class DevolucoesScreen extends StatelessWidget {
  List<TextEditingController> a = List<TextEditingController>(20);
  List<String> lista = List<String>(20).obs;
  List<String> ids = List<String>();
  List<String> peso = List<String>(20).obs;
  List<String> total = List<String>();
  List<String> nome = List<String>();

    final  SaidaController _controller = Get.put( SaidaController());

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
            title: Text("Devoluções"),
            centerTitle: true,
            backgroundColor: Colors.yellow,
          ),
            body: GetX<SaidaController >(
              init: Get.put<SaidaController >(SaidaController()),
              builder: (_controller) {
                if (_controller.saidaList2.length != null &&
                    SaidaController.isLoading == false) {

                  return ListView.builder(

                    itemCount: _controller.saidaList2.length,
                    itemBuilder: (_, index) {
                      ids.add(_controller.saidaList2[index].idsaida);
                      nome.add(_controller.saidaList2[index].produto);
                      total.add((double.parse(_controller.saidaList2[index].quantidade)*double.parse(_controller.saidaList2[index].peso)/1000).toString());
                      return Card(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Produto:" +
                                      _controller.saidaList2[index].produto),
                                ),
                                Column(
                                  children: [
                                    Text("Qty:" +
                                        _controller.saidaList2[index].quantidade+" Sacos"),
                                    Text("Pesos:" +
                                        _controller.saidaList2[index].peso+" kg"),
                                  ],
                                ),
                                Text("Data:" +
                                    _controller.saidaList2[index].data),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 1.0),
                                  child: Container(
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: TextEditingController(
                                          text: "",
                                        ),
                                        onChanged: (txt) {
                                          lista[index] = txt;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: 'Quantidade',
                                          labelText: 'Qty a devolver',
                                          labelStyle:
                                              TextStyle(color: Colors.yellow),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.yellow),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.yellow),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3.0),
                                  child: Container(
                                    width: 100,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: TextEditingController(
                                        text: "",
                                      ),
                                      onChanged: (txt) {
                                        peso[index] = txt;
                                      },
                                      decoration: const InputDecoration(
                                        hintText: 'peso unitario',
                                        labelText: 'Peso',
                                        labelStyle:
                                            TextStyle(color: Colors.yellow),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.yellow),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.yellow),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(()=>
                                    Text(lista[index]==null || peso[index]==null || lista[index]=='' || peso[index]==''?'total':(((double.parse(lista[index])*double.parse(peso[index])/1000))).toString()+"T"
                                    ),),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.yellow)),
                  );
                }
              }),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.yellow,
              onPressed: () {
                var bool = false;
                var boolqty = false;
                var idS = "";
                var Qts = "";
                var pesos = "";
                var nomes="";



                for (int i = 0; i < lista.length; i++) {
                  if (lista[i] != null && lista[i] != '') {
                    if (peso[i] != '' && peso[i] != null) {
                      Qts += lista[i] + ",";
                        idS += ids[i] + ",";
                      pesos += peso[i] + ",";
                      nomes +=nome[i]+",";

                    } else {
                      bool = true;
                    }
                  } else {}
                }
                for (int i = 0; i < lista.length; i++) {
                  if (lista[i] != null && lista[i] != '' && peso[i] != null && peso[i] != '') {
                    if (total[i] != null && total[i] != '') {
                      print(double.parse(total[i]).toString() +"    "+ (double.parse(peso[i]) * double.parse(lista[i]) / 1000).toString());
                      if (double.parse(total[i]) < (double.parse(peso[i]) * double.parse(lista[i]) / 1000)) {

                        boolqty = true;
                      } else {}
                    }
                  }
                }

                if (bool == true || Qts.length < 1) {
                  Get.snackbar("Valores invalidos", "Preencha todos os campos");
                } else if (boolqty == true ) {
                  Get.snackbar("Valores invalidos",
                      "Valores inseridos sao maiores que o stock retirado");
                } else {

                  showDialog(
                      context: context,
                      builder: (context) => DialogAlertDevolucoes(idS: idS,quantidade: Qts,peso: pesos,nome:nomes));
                }

                bool = false;
                boolqty = false;
              },
              child: Icon(Icons.check))),
    );
  }
}
