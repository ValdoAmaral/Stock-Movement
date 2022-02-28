import 'package:flutter/material.dart';
import 'package:flutter_application_stock/screens/home_screen.dart';
import 'package:get/get.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Perfil"),
          centerTitle:true,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAll(HomeScreen());
            },
          ),
        ),
        body: Container(
          height: 600,
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: (Image.asset("fotos/avatar2.jpg")),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Nome:Valdo Amaral",style: TextStyle(fontSize: 24),),
                  Text("Cargo:Coordenador distrital",style: TextStyle(fontSize: 20),),
                  Text("Idade:23",style: TextStyle(fontSize: 20),),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
