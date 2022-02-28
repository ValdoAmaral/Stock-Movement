import 'package:flutter/material.dart';
import 'package:flutter_application_stock/controllers/perdidos_controller.dart';
import 'package:flutter_application_stock/screens/home_screen.dart';
import 'package:flutter_application_stock/widgets/dialog_alert_recuperacao.dart';
import 'package:get/get.dart';
class RecuperadosScreen extends StatelessWidget {
  List<TextEditingController> a = List<TextEditingController>(20);
  List<String> quantidades = List<String>(20).obs;
  List<String> ids = List<String>();
  List<String> peso = List<String>(20).obs;
  List<String> qtbackup = List<String>();
  List<String> nome = List<String>();
  List<String> total=List<String>();
  List<String> quantidades2 = List<String>(20);

  final PerdidosController _controller = Get.put( PerdidosController());

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
            title: Text("Recuperar produtos"),
            centerTitle: true,
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: GetX<PerdidosController>(
              init: Get.put<PerdidosController >(PerdidosController()),
              builder: (_controller) {
                if (_controller.perdasList.length != null &&
                    PerdidosController.isLoading == false) {
                  return ListView.builder(
                    itemCount: _controller.perdasList.length,
                    itemBuilder: (_, index) {
                      ids.add(_controller.perdasList[index].idperda);
                      nome.add(_controller.perdasList[index].produto);

                  total.add((double.parse(_controller.perdasList[index].perda)).toString());
                      return Card(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Produto:" +
                                      _controller.perdasList[index].produto),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child:      Text("Peso:" +
                                      _controller.perdasList[index].perda+"Kg" ),
                                ),
                                // Text("Qty:" +
                                //     _controller.perdasList[index].quantidade),
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
                                         quantidades[index] = txt;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: 'Embalagens',
                                          labelText: 'Qty a recuperar',
                                          labelStyle:
                                          TextStyle(color: Colors.deepPurpleAccent),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.deepPurpleAccent),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.deepPurpleAccent),
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
                                        hintText: 'Kg',
                                        labelText: 'Peso',
                                        labelStyle:
                                        TextStyle(color: Colors.deepPurpleAccent),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.deepPurpleAccent),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.deepPurpleAccent),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(()=>
                                    Text(quantidades[index]==null || peso[index]==null || quantidades[index]=='' || peso[index]==''?'total':(((double.parse(quantidades[index])*double.parse(peso[index])/1000))).toString()+"t"
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
                        new AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent)),
                  );
                }
              }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: (){
            var boolqty = false;
            var bool = false;
            var idS = "";
            var Qts = "";
            var pesos = "";
            var nomes="";
            for (int i = 0; i < quantidades.length; i++) {
              if ( quantidades[i] != null &&  quantidades[i] != '') {
                if (peso[i] != '' &&
                    peso[i] != null
                    ) {
                  Qts += quantidades[i] + ",";
                  idS += ids[i] + ",";
                  pesos += peso[i] + ",";
                  nomes += nome[i] + ",";
                } else {
                  bool = true;
                }
              } else {}
            }
            for (int i = 0; i < quantidades.length; i++) {
              if (quantidades[i] != null && quantidades[i] != '') {
                if (total[i] != null && total[i] != '') {
                  print(double.parse(total[i]).toString() +"    "+ (double.parse(peso[i]) * double.parse(quantidades[i]) / 1000).toString());
                  if ((double.parse(total[i])/1000) < (double.parse(peso[i]) * double.parse(quantidades[i]) / 1000)) {

                    boolqty = true;
                  } else {}
                }
              }
            }
            if (bool == true || Qts.length < 1 ) {
              Get.snackbar("Valores invalidos", "Preencha todos os campos");
            } else if (boolqty == true) {
              Get.snackbar("Valores invalidos",
                  "Valores inseridos sao maiores que o stock perdido");
            } else {
              showDialog(
                  context: context,
                  builder: (context) =>RecuperacaoDialog(quantidade:Qts,idS:idS,peso: pesos,nome:nomes));
            }

          },
        ),

   ),
    );
  }
}
