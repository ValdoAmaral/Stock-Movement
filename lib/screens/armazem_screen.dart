
import 'package:carousel_slider/carousel_slider.dart';
import'package:flutter/material.dart';
import 'package:flutter_application_stock/screens/home_screen.dart';
import 'package:get/get.dart';
class ArmazemScreen extends StatefulWidget {
  @override
  _ArmazemScreenState createState() => _ArmazemScreenState();
}
enum SingingCharacter { lafayette, jefferson }
class _ArmazemScreenState extends State<ArmazemScreen> {
  @override
  Widget build(BuildContext context) {
    SingingCharacter _character = SingingCharacter.lafayette;
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 250,
                    child: Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(height:200.0),
                          items: ["fotos/armazem.jpg","fotos/armazem2.jpg"].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Image.asset('$i')
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Positioned(
                          left: 0,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.green,
                            onPressed: () {
                              Get.to(HomeScreen());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Detalhes do armázem:",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Localização:Metuge",
                                style: TextStyle(
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Capacidade:56 toneladas",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Dimensão:200 m2",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[200],
                                  offset: Offset(-1, -1),
                                  blurRadius: 1),
                            ]),
                        height: 500,
                        child:Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Estado do armázem",
                                        style:
                                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  ),
                                  Text("Teto",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(" Excelente"),
                                          Radio(
                                            value: 1,
                                            activeColor: Colors.green,
                                            onChanged: (val) {

                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Medio"),
                                          Radio(
                                            value: 2,
                                            activeColor: Colors.yellow,
                                            onChanged: (val) {

                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Mediocre"),
                                          Radio(
                                            value: 3,
                                            activeColor: Colors.red,
                                            onChanged: (val) {

                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: RaisedButton(
                                        color: Colors.green,
                                        child:Text("Carregar foto")
                                    ),
                                  )
                                ],

                              ),
                              Column(
                                children: [
                                  Text("Paredes",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(" Excelente"),
                                          Radio(
                                            value: 1,
                                            activeColor: Colors.green,
                                            onChanged: (val) {

                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Medio"),
                                          Radio(
                                            value: 2,
                                            activeColor: Colors.yellow,
                                            onChanged: (val) {

                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Mediocre"),
                                          Radio(
                                            value: 3,
                                            activeColor: Colors.red,
                                            onChanged: (val) {

                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Center(

                                    child: RaisedButton(
                                        color: Colors.green,
                                        child:Text("Carregar foto")
                                    ),
                                  )
                                ],

                              ),
                              Column(
                                children: [
                                  Text("Chao",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(" Excelente"),
                                          Radio(
                                            value: 1,
                                            activeColor: Colors.green,
                                            onChanged: (val) {

                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Medio"),
                                          Radio(
                                            value: 2,
                                            activeColor: Colors.yellow,
                                            onChanged: (val) {

                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Mediocre"),
                                          Radio(
                                            value: 3,
                                            activeColor: Colors.red,
                                            onChanged: (val) {

                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: RaisedButton(
                                        color: Colors.green,
                                        child:Text("Carregar foto")
                                    ),
                                  )
                                ],

                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
