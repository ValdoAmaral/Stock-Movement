import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_stock/controllers/auth_controller.dart';
import 'package:flutter_application_stock/screens/produto_adicionado_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class DialogDetalhesAlert2 extends StatefulWidget {
  final String idS,produto, quantidade, observacao, perdas, peso, waybill, batch;

  DialogDetalhesAlert2(
      this.idS,
      this.produto,
      this.quantidade,
      this.observacao,
      this.perdas,
      this.peso,
      this.waybill,
      this.batch,
      );

  @override
  _DialogDetalhesAlert2State createState() => _DialogDetalhesAlert2State(
      this.idS,
      this.produto,
      this.quantidade,
      this.observacao,
      this.perdas,
      this.peso,
      this.waybill,
      this.batch);
}

class _DialogDetalhesAlert2State extends State<DialogDetalhesAlert2> {

  List<bool> loading =[true].obs;

  final String idS,produto, quantidade, observacao, perdas, peso, waybill, batch;

  _DialogDetalhesAlert2State(this.idS,this.produto, this.quantidade, this.observacao, this.perdas,
      this.peso, this.waybill, this.batch);




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
            height:200,
            child: Column(
              //content alignment to center
              children: <Widget>[
                Container(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Detalhes da entrada:",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:18),),
                        Text("Nome do produto:"+produto.toString(),style:TextStyle(color: Colors.black)),
                        Text("Quantidade:"+quantidade.toString()+" Embalagens",style:TextStyle(color: Colors.black)),
                        Text("Peso Unitario:"+peso.toString()+" Kilogramas",style:TextStyle(color: Colors.black)),
                        Text("Waybill number:"+batch.toString(),style:TextStyle(color: Colors.black)),
                        Text("Total:"+ ((double.parse(peso)*double.parse(quantidade)/1000)).toString()+" Toneladas",style:TextStyle(color: Colors.black)),
                      ],
                    )

                ),
                SizedBox(height: 10),
                Container(
                    child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed:(){

                        }, child:Text("Visualizar imagem do waybill"))
                ),

              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: 50,
            //backgroundImage: Ima,
            child: Icon(
              Icons.double_arrow,
              color: Colors.white,
            ),
            //backgroundImage: AssetImage("assets/logo1.png"),
          ),
        )
      ],
    );
  }
}
