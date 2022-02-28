import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_stock/controllers/auth_controller.dart';
import 'package:flutter_application_stock/screens/produto_adicionado_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class DialogAlert2 extends StatefulWidget {
  final String idS, quantidade, observacao, perdas, peso, waybill, batch;

  DialogAlert2(
    this.idS,
    this.quantidade,
    this.observacao,
    this.perdas,
    this.peso,
    this.waybill,
    this.batch,
  );

  @override
  _DialogAlert2State createState() => _DialogAlert2State(
      this.idS,
      this.quantidade,
      this.observacao,
      this.perdas,
      this.peso,
      this.waybill,
      this.batch);
}

class _DialogAlert2State extends State<DialogAlert2> {
  File _image;
  final picker = ImagePicker();
  List<bool> loading =[true].obs;
  

  final String idS, quantidade, observacao, perdas, peso, waybill, batch;

  _DialogAlert2State(this.idS, this.quantidade, this.observacao, this.perdas,
      this.peso, this.waybill, this.batch);

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  Future<void> uploadImage() async {
    Get.snackbar("", "Carregando", backgroundColor: Colors.red);
    var url = Uri.parse("https://www.seppa.co.mz/apisgrd/AdminController/Call");
    var map = Map<String, dynamic>();
    map['ids'] = idS;
    map['quantidades'] = quantidade;
    List<int> imageBytes =_image.readAsBytesSync();
    String baseimage = base64Encode(imageBytes);
    map['image'] = baseimage;
    map['notas'] = observacao;
    map['id'] = AuthController.idarmazem;
    map['waybill'] = waybill;
    map['peso'] = peso;
    map['perdas'] = perdas;
    map['batch'] = batch;

    print(baseimage);

    try {
      var response = await http.post(url, body: map);

      print(response.body);
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body); //decode json data
        if (jsondata["error"]) {
          print(jsondata["msg"]);
        } else {
          print("Upload successful");
        }
      } else {
        print(response);
        print("Error during connection to server");
      }
    } catch (e) {
      loading[0]=false;
      Get.snackbar("", "Carregado com sucesso", backgroundColor: Colors.green);

      Get.to(ProdutoAdicionado());
      //there is error during converting file image to base64 encoding.
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
            height: 300,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //content alignment to center
              children: <Widget>[
                Container(
                    child: _image == null
                        ? Container()
                        : Container(
                            child: SizedBox(
                                height: 150,
                                child: Image.file(
                                    _image) //load image from file
                                ))),
                Container(
                    child: _image == null
                        ? Container()
                        : Container(
                            child: RaisedButton.icon(
                            onPressed: () {
                              uploadImage();


                            },
                            icon: Icon(Icons.file_upload),
                            label: Text("Carregar imagem do waybill"),
                            color: Colors.green,
                            colorBrightness: Brightness.dark,
                            //set brightness to dark, because deepOrangeAccent is darker coler
                            //so that its text color is light
                          ))),
                Container(
                  child: RaisedButton.icon(
                    onPressed: () {
                      getImage(); // call choose image function
                    },
                    icon: Icon(Icons.folder_open),
                    label: Text("Escolha imagem do waybill"),
                    color: Colors.green,
                    colorBrightness: Brightness.dark,
                  ),
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
              Icons.note,
              color: Colors.white,
            ),
            //backgroundImage: AssetImage("assets/logo1.png"),
          ),
        )
      ],
    );
  }
}
