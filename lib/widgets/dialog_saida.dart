import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class DialogDetalhesSaida extends StatefulWidget {
  final String idS,produto, quantidade, observacao, perdas,ip, peso, batch;

  DialogDetalhesSaida(
      this.idS,
      this.produto,
      this.quantidade,
      this.observacao,
      this.perdas,
      this.ip,
      this.peso,
      this.batch,

      );

  @override
  _DialogDetalhesSaidaState createState() => _DialogDetalhesSaidaState(
      this.idS,
      this.produto,
      this.quantidade,
      this.observacao,
      this.perdas,
      this.ip,
      this.peso,
      this.batch,
      );
}

class _DialogDetalhesSaidaState extends State<DialogDetalhesSaida> {

  List<bool> loading =[true].obs;

  final String idS,produto, quantidade, observacao, perdas,ip, peso, batch;

  _DialogDetalhesSaidaState(this.idS,this.produto, this.quantidade, this.observacao, this.perdas,this.ip,
      this.peso, this.batch);




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
                        Text("Detalhes da saida:",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:18),),
                        Text("Nome do produto:"+produto.toString(),style:TextStyle(color: Colors.black)),
                        Text("Quantidade:"+quantidade.toString()+" Embalagens",style:TextStyle(color: Colors.black)),
                        Text("Peso Unitario:"+peso.toString()+" Kilogramas",style:TextStyle(color: Colors.black)),
                        Text("Ip number: "+ip.toString(),style:TextStyle(color: Colors.black)),
                       // Text("Total:"+ ((double.parse(peso)*double.parse(quantidade)/1000)).toString()+" Toneladas",style:TextStyle(color: Colors.black)),
                      ],
                    )

                ),
                SizedBox(height: 10),
                Container(
                    child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed:(){

                        }, child:Text("Visualizar imagem do ip"))
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
            backgroundColor: Colors.red,
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
