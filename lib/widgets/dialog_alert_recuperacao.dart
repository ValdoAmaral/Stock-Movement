import 'dart:convert';
import 'package:flutter_application_stock/screens/recuperados_screen.dart';
import 'package:http/http.dart' as http;
import "package:flutter/material.dart";
import 'package:flutter_application_stock/controllers/auth_controller.dart';
import 'package:get/get.dart';

class RecuperacaoDialog extends StatefulWidget {
  final String idS, quantidade, peso,nome;

  const RecuperacaoDialog({Key key, this.idS, this.quantidade, this.peso,this.nome})
      : super(key: key);
  @override
  _RecuperacaoDialogState createState() =>
      _RecuperacaoDialogState(this.idS, this.quantidade, this.peso,this.nome);
}

class _RecuperacaoDialogState extends State<RecuperacaoDialog> {
  final String idS, quantidade, peso,nome;

  _RecuperacaoDialogState(this.idS, this.quantidade, this.peso,this.nome);

  Future<void> uploadRecuperacao() async {
    Get.snackbar("", "Carregando", backgroundColor: Colors.red);
    var url = Uri.parse(
        "http://sonito.000webhostapp.com/apisgrd/AdminController/setRecuperado");
    var map = Map<String, dynamic>();
    map['ids'] = idS;
    map['quantidades'] = quantidade;
    map['id'] = AuthController.idarmazem;
    map['peso'] = peso;
    map['nome']=nome;

    try {
      var response = await http.post(url, body: map);
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body); //decode json data
        if (jsondata["error"]) {
          print(jsondata["msg"]);
        } else {
          print("Upload successful");
        }
      } else {
       // print("Error during connection to server");
       // Get.snackbar("", "Erro durante conexao com servidor",

      }
    } catch (e) {
      Get.snackbar("", "Carregado com sucesso", backgroundColor: Colors.green);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogcontent(context),
    );
  }

  dialogcontent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 100, left: 16, bottom: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Container(
            height: 200,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //content alignment to center
              children: <Widget>[
                Container(child: Column(children: [

                    Text("Produto:"+nome+"\n"+""+"Quantidade:"+quantidade+"\n"+""+"Peso:"+peso+"\n"),

                ])),
                Text(
                  "Recuperar os produtos?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
                    width: 300,
                    child: Row(
                      children: [
                        Expanded(
                          child: RaisedButton.icon(
                            onPressed: () {
                              uploadRecuperacao();
                            },
                            icon: Icon(Icons.check),
                            label: Text("Confirmar",style:TextStyle(fontSize: 12)),
                            color: Colors.deepPurpleAccent,
                            colorBrightness: Brightness.dark,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: RaisedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.cancel),
                            label: Text("Cancelar",style:TextStyle(fontSize: 12)),
                            color: Colors.red,
                            colorBrightness: Brightness.dark,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.deepPurpleAccent,
            radius: 50,
            //backgroundImage: Ima,
            child: Icon(
              Icons.assistant_direction,
              color: Colors.white,
            ),
            //backgroundImage: AssetImage("assets/logo1.png"),
          ),
        )
      ],
    );
  }
}
