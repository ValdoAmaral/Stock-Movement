import 'package:flutter/material.dart';
import 'package:flutter_application_stock/controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  List<bool> visibildade =[false].obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "fotos/logo.png",
                  width: 240,
                  height: 240,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightGreen),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Usuario",labelStyle: TextStyle(
                      color: Colors.black),
                        icon: Icon(Icons.person_outline,color: Colors.green,)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightGreen),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child:
                  Obx(()=>TextFormField(
                    validator: (val) => val.length < 6 ? 'Password too short.' : null,
                    controller: passController,
                    obscureText: visibildade[0],

                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Palavra-passe",labelStyle: TextStyle(
                        color: Colors.black
                    ),
                        suffixIcon: IconButton(
                          color: Colors.green,
                          icon: Obx(()=>

                              Icon(

                               visibildade[0] ? Icons.visibility: Icons.visibility_off
                          ),
                              ),
                          onPressed: () {
                                   visibildade[0] = !  visibildade[0];
                          },
                        ),
                        icon: Icon(Icons.lock,color: Colors.green)),

                  ),

                      ),),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () async {
                    controller.login2(emailController.text, passController.text);
                  Get.snackbar("Login", "Procurando pelo usuario");
                },
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
