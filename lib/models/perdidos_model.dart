
import 'dart:core';
import 'dart:convert';

List<PerdidosModel> PerdidosModelFromJson(String str) =>
    List<PerdidosModel>.from(json.decode(str).map((x) =>PerdidosModel.fromJson(x)));


class PerdidosModel {
  String idperda;
  String produto;
  String quantidade;
  String perda;
  String data;
  PerdidosModel({this.idperda, this.produto,this.perda,this.data,this.quantidade});

  factory PerdidosModel.fromJson(Map<String, dynamic> json) {
    return PerdidosModel(
        idperda: json["identrada"],
        produto: json["produto"],
        data: json["data"],
        perda: json["perda"],
        quantidade: json["quantidade"]
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "EntradaId": idperda,
      "produto": produto,
      "data": data,
      "perda":perda,
      "quantidade":quantidade
    };
  }
  static List<PerdidosModel> toDoFromJson(String resp){
    final parsed=json.decode(resp).cast<Map<String,dynamic>>();
    return parsed.map<PerdidosModel>((json)=>PerdidosModel.fromJson(json)).toList();
  }
}




