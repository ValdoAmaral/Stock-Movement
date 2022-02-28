
import 'dart:core';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

import 'package:image_picker/image_picker.dart';



List<SaidaModel> SaidaModelFromJson(String str) =>
    List<SaidaModel>.from(json.decode(str).map((x) => SaidaModel.fromJson(x)));


class SaidaModel {
  String idsaida;
  String produto;
  String data;
  String quantidade;
  String imagem;
  String ip;
  String notas;
  String peso;

  SaidaModel({this.idsaida, this.produto, this.data, this.quantidade,this.imagem,this.notas,this.ip,this.peso});

  factory SaidaModel.fromJson(Map<String, dynamic> json) {
    //tornamos o video um objeto para nao ter problemas na hora de mudar screens
    return SaidaModel(
      idsaida: json["idsaida"],
      produto: json["produto"],
      data: json["data"],
      quantidade: json["quantidade"],
      imagem: json["imagem"],
      ip: json["ip"],
      notas: json["notas"],
      peso: json["peso"]
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "SaidaId": idsaida,
      "produto": produto,
      "quantidade": quantidade,
      "data": data,
      "imagem": imagem,
      "ip":ip,
      "notas":notas,
      "peso":peso
    };
  }
  static List<SaidaModel> toDoFromJson(String resp){
    final parsed=json.decode(resp).cast<Map<String,dynamic>>();
    return parsed.map<SaidaModel>((json)=>SaidaModel.fromJson(json)).toList();
  }
}




