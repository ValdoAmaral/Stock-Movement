
import 'dart:core';
import 'dart:convert';
List<EntradaModel>    EntradaModelFromJson(String str) =>
    List<EntradaModel>.from(json.decode(str).map((x) => EntradaModel.fromJson(x)));


class EntradaModel {
 String identrada;
 String produto;
 String data;
 String quantidade;
 String imagem;
 String peso;
 String toneladas;
 String  perdas;
 String waybill;
 String batchnr;
EntradaModel({this.toneladas, this.identrada, this.produto, this.data, this.quantidade, this.imagem, this.peso, this.perdas, this.waybill, this.batchnr});

  factory EntradaModel.fromJson(Map<String, dynamic> json) {
    return EntradaModel(
      identrada: json["identrada"],
      produto: json["produto"],
      data: json["data"],
      quantidade: json["quantidade"],
      imagem: json["imagem"],
      peso:json["peso"],
      toneladas:json["total"],
      perdas:json["perdas"],
      waybill:json["waybill"],
      batchnr:json["batch_number"]
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "EntradaId": identrada,
      "produto": produto,
      "quantidade": quantidade,
      "data": data,
      "imagem": imagem,
      "waybill":waybill,
     " batch_number": batchnr,
      "perdas":perdas,
      "total":toneladas,
      "peso":peso
 };
  }
  static List<EntradaModel> toDoFromJson(String resp){
    final parsed=json.decode(resp).cast<Map<String,dynamic>>();
    return parsed.map<EntradaModel>((json)=>EntradaModel.fromJson(json)).toList();
  }
}




