import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;


List<StockModel> StockModelFromJson(String str) =>
    List<StockModel>.from(json.decode(str).map((x) => StockModel.fromJson(x)));


class StockModel {
  String id;
  String nome;
  String categoria;
  String quantidade;
  String imagem;
  String idproduto;


  StockModel({this.id, this.nome, this.quantidade, this.categoria,this.imagem,this.idproduto});

  factory StockModel.fromJson(Map<String, dynamic> json) {
    //tornamos o video um objeto para nao ter problemas na hora de mudar screens
    return StockModel(
      id: json["idstock"],
      nome: json["produto"],
      quantidade: json["quantidade"],
      categoria: json["categoria"],
      idproduto: json["idproduto"],
      imagem: json["img"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "StockId": id,
      "nome": nome,
      "quantidade": quantidade,
      "categoria": categoria,
      "imagem": imagem,
      "idproduto":idproduto,
    };
  }
  static List<StockModel> toDoFromJson(String resp){
    final parsed=json.decode(resp).cast<Map<String,dynamic>>();
    return parsed.map<StockModel>((json)=>StockModel.fromJson(json)).toList();
  }
}
