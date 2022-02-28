
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_application_stock/controllers/saida_controller.dart';
import 'package:flutter_application_stock/screens/produto_retirado_screen.dart';
import 'package:flutter_application_stock/screens/stock_screen.dart';
import 'package:get/get.dart';


//import http package manually

class DialogMessage extends StatefulWidget {
  final String id, msg;

  DialogMessage(
      this.id,
      this.msg,
      );

  DialogAlertState createState() =>
      DialogAlertState(this.id, this.msg);
}

class DialogAlertState extends State<DialogMessage> {

  final String id,msg;

  DialogAlertState(this.id, this.msg);


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
            height: 220,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //content alignment to center
              children: <Widget>[
                     Text(msg),
                     SizedBox(height:40),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         RaisedButton(
                           child:
                             Text("Aceitar",style:TextStyle(color: Colors.white),),
                           color: Colors.green,

                           onPressed: (){

                           },

                         ),
                         SizedBox(width: 20,),
                        RaisedButton(
                           color: Colors.red,
                             child:
                             Text("Cancelar",style:TextStyle(color: Colors.white),),
                           onPressed: (){
                             Navigator.pop(context);

                           },
                         ),
                       ],
                     )



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
              Icons.message,
              color: Colors.white,
            ),
            //backgroundImage: AssetImage("assets/logo1.png"),
          ),
        )
      ],
    );
  }
}
