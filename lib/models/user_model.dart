import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;


List<UserModel> UserModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

class UserModel{
  String email;
  String pass;
  String distrito;
  String idDistrito;
  String armazemNome;
  String idArmazem;
  String idAdmin;

UserModel({this.idAdmin,this.idArmazem, this.email, this.pass, this.armazemNome,this.distrito,this.idDistrito});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    //tornamos o video um objeto para nao ter problemas na hora de mudar screens
    return UserModel(
      idAdmin: json["idadmin"],
      idArmazem: json["idarmazem"],
      idDistrito: json["iddistrito"],
      email: json["email"],
      armazemNome:json [""],
      distrito:json [""],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "idadmin": idAdmin,
      "idarmazem": idArmazem,
      "":idDistrito,
      "email": email,
      "distrito":distrito,
      "":armazemNome
    };
  }
  static List<UserModel> toDoFromJson(String resp){
    final parsed=json.decode(resp).cast<Map<String,dynamic>>();
    return parsed.map<UserModel>((json)=>UserModel.fromJson(json)).toList();
  }
}