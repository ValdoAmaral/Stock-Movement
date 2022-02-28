import 'package:flutter/material.dart';
import 'package:flutter_application_stock/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_stock/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static var isLoading = false.obs;
  static String iduser;
  static String idarmazem;
  var data = '';
  @override
  void onInit() {}
  void login2(String email, String pass) async {
    var map = Map<String, dynamic>();
    map['email'] = email;
    map['senha'] = pass;


    var client = http.Client();
    var url = Uri.parse(
        "https://www.seppa.co.mz/apisgrd/AdminController/getUsuarioArmazemLogin");
    //
    var response = await client.post(url, body: map);
    print(response.body);
    if (response.statusCode == 200) {
      data = response.body;
print(data);
      try {
        if (data.toString().length < 7) {
          print('falha ao entrar');
          Get.snackbar("Erro", "Nome de usuario ou palavra passe-errada");
        } else {
          setLoginData(UserModel.toDoFromJson(data)[0]);
          Get.snackbar("Sucesso", "Sucesso no login");
          Get.offAll(HomeScreen());
        }
      } catch (e) {}
    } else {
      isLoading = true.obs;
    }
  }

  static setLoginData(UserModel u) async {
    SharedPreferences sessao = await SharedPreferences.getInstance();

    iduser = u.idAdmin;
    idarmazem = u.idArmazem;
    sessao.setString("id", u.idAdmin);
    sessao.setString("idarmazem", u.idArmazem);

    sessao.commit();
  }

  static Future<String> getStateLoginData() async {
    SharedPreferences sessao = await SharedPreferences.getInstance();
    return sessao.getString("id");
  }

  static Future<String> getPinLoginData() async {
    SharedPreferences sessao = await SharedPreferences.getInstance();
    return sessao.get("senha");
  }

  static Future<UserModel> getPinLoginDataUser() async {
    SharedPreferences sessao = await SharedPreferences.getInstance();
    UserModel u = new UserModel();
    u.idAdmin = sessao.getString("id");
    u.idArmazem = sessao.getString("idarmazem");
    return u;
  }

  static DestroyLoginData() async {
    SharedPreferences sessao = await SharedPreferences.getInstance();
    sessao.clear();
  }
}
