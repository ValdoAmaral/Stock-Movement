import 'package:flutter/material.dart';
import 'package:flutter_application_stock/controllers/bindings/auth_binding.dart';
import 'package:flutter_application_stock/screens/devolucoes_screen.dart';
import 'package:flutter_application_stock/screens/home_screen.dart';
import 'package:flutter_application_stock/screens/login_screen.dart';
import 'package:flutter_application_stock/screens/perfil_screen.dart';
import 'package:flutter_application_stock/screens/saida_screen.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stock move',
      theme: ThemeData(
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home:LoginScreen(),
      initialBinding: AuthBinding(),
    );
  }
}
