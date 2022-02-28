import 'package:flutter/material.dart';
import 'package:flutter_application_stock/controllers/auth_controller.dart';
import 'package:flutter_application_stock/screens/perfil_screen.dart';
import 'package:flutter_application_stock/screens/produto_adicionado_screen.dart';
import 'package:flutter_application_stock/screens/produto_retirado_screen.dart';
import 'package:flutter_application_stock/screens/recuperados_screen.dart';
import 'package:flutter_application_stock/screens/saida_screen.dart';
import 'package:flutter_application_stock/screens/stock_screen.dart';
import 'package:flutter_application_stock/screens/entrada_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_stock/screens/login_screen.dart';
import 'package:flutter_application_stock/screens/devolucoes_screen.dart';
import 'armazem_screen.dart';

class HomeScreen extends GetWidget<AuthController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
        title: Text("Menu Principal"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Bem-vindo'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              leading: Text("Menu principal"),
              trailing: Icon(Icons.menu),
              onTap: () {
                Get.offAll(HomeScreen());
              },
            ),
            ListTile(
              leading: Text("Meu perfil"),
              trailing: Icon(Icons.person),
              onTap: () {
                Get.offAll(PerfilScreen());
              },
            ),
            ListTile(
              trailing: Icon(Icons.exit_to_app),
              leading: Text("Sair do aplicativo"),
              onTap: () {
                Get.offAll(LoginScreen());
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(-2, -1),
                            blurRadius: 5),
                      ]),
                  padding: const EdgeInsets.all(14.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.offAll(SaidaScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 100,
                                      child: Image.asset(
                                          'fotos/Web Botoes 3.JPG')),
                                  Text(
                                    "Retirar",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(-2, -1),
                            blurRadius: 5),
                      ]),
                  padding: const EdgeInsets.all(14.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(HistoriaScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 100,
                                      child: Image.asset(
                                          'fotos/Web Botoes 1.JPG')),

                                   Expanded(
                                      child: Text(
                                        "Retirado",
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(-2, -1),
                            blurRadius: 5),
                      ]),
                  padding: const EdgeInsets.all(14.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(TesteScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 100,
                                      child:
                                      Image.asset('fotos/waybill.jpg')),
                                  Expanded(
                                    child: Text(
                                      "Adicionar",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(-2, -1),
                            blurRadius: 5),
                      ]),
                  padding: const EdgeInsets.all(14.0),
                  child: GestureDetector(
                    onTap: () {
                           Get.to(ProdutoAdicionado());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 100,
                                      child:
                                      Image.asset('fotos/health-report.png')),
                                  Expanded(
                                    child:Text(
                                      "Adicionado",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    )
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(-2, -1),
                            blurRadius: 5),
                      ]),
                  padding: const EdgeInsets.all(14.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(HistoryScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 100,
                                      child:
                                      Image.asset('fotos/trabalhador.jpg')),
                                  Expanded(
                                    child: Text(
                                      "Verificar Stock",
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(-2, -1),
                            blurRadius: 5),
                      ]),
                  padding: const EdgeInsets.all(14.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(DevolucoesScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 100,
                                      child:
                                      Image.asset('fotos/Web Botoes 2.JPG')),

                                  Text(
                                    "Devoluções",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(-2, -1),
                            blurRadius: 5),
                      ]),
                  padding: const EdgeInsets.all(14.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(RecuperadosScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        height: 100,
                                        child:
                                        Image.asset('fotos/spin.jpg')),
                                  ),
                                  Center(
                                    child:  Text(
                                      "Recuperar produto",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(-2, -1),
                            blurRadius: 5),
                      ]),
                  padding: const EdgeInsets.all(14.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ArmazemScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        height: 100,
                                        child:
                                        Image.asset('fotos/warehouse.png')),
                                  ),
                                  Center(
                                    child:  Text(
                                      "Ver armázem",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
