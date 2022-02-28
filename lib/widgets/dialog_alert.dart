import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_stock/classes/ipClass.dart';
import 'package:flutter_application_stock/controllers/auth_controller.dart';
import 'package:flutter_application_stock/screens/produto_retirado_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter_application_stock/services/mobile_pdf.dart';


//import http package manually

class DialogAlert extends StatefulWidget {
  final String idS, quantidade, nota,ip,peso,batchnr,nomes;

  DialogAlert(
    this.idS,
    this.quantidade,
    this.nota,
      this.peso,this.ip,this.batchnr,this.nomes
      );

  DialogAlertState createState() =>
      DialogAlertState(this.idS, this.quantidade, this.nota, this.peso,this.ip,this.batchnr,this.nomes);
}

class DialogAlertState extends State<DialogAlert> {
  File _image;
  final picker = ImagePicker();
  final String idS, quantidade, nota,peso,ip,batchnr,nomes;

  DialogAlertState(this.idS, this.quantidade, this.nota, this.peso,this.ip,this.batchnr, this.nomes);
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> uploadImage() async {
    Get.snackbar("", "Carregando",backgroundColor: Colors.red);
    var url = Uri.parse("https://www.seppa.co.mz/apisgrd/AdminController/SetSaida");
    try {
      List<int> imageBytes = _image.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      var response = await http.post(url, body: {
        'image': baseimage,
        'ids':idS,
        'quantidades':quantidade,
        'idarmazem':AuthController.idarmazem,
       // 'id':AuthController.id,
        'notas':nota,
        'peso':peso,
        'ip':ip,
        'batchnr':batchnr

      });

      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body); //decode json data
        if (jsondata["error"]) {
          print(jsondata["msg"]);
        } else {
          print("Upload successful");
        }
      } else {
        print("Error during connection to server");
        //Get.snackbar("", "Error during connection to server",backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("", "Carregado com sucesso",backgroundColor: Colors.green);
      Get.to(HistoriaScreen());
      //there is error during converting file image to base64 encoding.
    }
  }
  Future<void> _createPDF(IpClass ipclass) async{
    PdfDocument document = PdfDocument();
    final page = document.pages.add();


    page.graphics.drawString(
        " IP-NOTA DE ENTREGA ", PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: const Rect.fromLTWH(170, 0, 0, 0));
    page.graphics.drawString(
        "\nM-IP NO._________", PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: const Rect.fromLTWH(380, 10, 0, 0));
    page.graphics.drawString(
        " *Deve ser somente utilizado por CPs autorizados pelo PMA\n Original/Copia do IP/Copia para CTS/Copia para Destino/Copia do livro",
        PdfStandardFont(PdfFontFamily.helvetica, 8),
        bounds: const Rect.fromLTWH(150, 50, 0, 0));
    //Grid dos  detalhes da trancassao
    PdfGrid grid2 = PdfGrid();
    grid2.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 8),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid2.columns.add(count: 5);
    grid2.headers.add(2);
    PdfGridRow header2 = grid2.headers[1];
    PdfGridRow headers2 = grid2.headers[0];
    headers2.cells[0].value = "| Detalhes da transacao";
    header2.cells[0].value = '1.Origem (Local)';
    header2.cells[1].value = '2.Origem (Armazem)';
    header2.cells[2].value = '3.Destino (Local)';
    header2.cells[3].value = '7.Projeto no';
    header2.cells[4].value = '9.Data de carregamento';
    PdfGridRow row2 = grid2.rows.add();
    row2.cells[0].value = ipclass.local;
    row2.cells[1].value=ipclass.destino;
    grid2.draw(page: page, bounds: const Rect.fromLTWH(0, 70, 0, 0));

    //Grid dos  detalhes da trancassao continuacao
    PdfGrid grid3 = PdfGrid();
    grid3.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 8),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid3.columns.add(count: 5);
    grid3.headers.add(1);
    PdfGridRow header3 = grid3.headers[0];
    header3.cells[0].value = '4.Destino (Armazem)';
    header3.cells[1].value = '5.Destino de Alocacao';
    header3.cells[2].value = '6.Consignatario';
    header3.cells[3].value = '8.LTI No';
    header3.cells[4].value = '9.Data de despacho';
    PdfGridRow row3 = grid3.rows.add();
    row3.cells[0].value = 'Montepuez';
    grid3.draw(page: page, bounds: const Rect.fromLTWH(0, 122, 0, 0));
    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 8),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid.columns.add(count: 6);
    grid.headers.add(2);
    PdfGridRow header = grid.headers[1];
    PdfGridRow headers = grid.headers[0];
    headers.cells[0].value = "||. Detalhes do carregamento";
    header.cells[0].value = '10.Numero de SI';
    header.cells[1].value = '11.Produtos';
    header.cells[2].value = '12.Embalagem';
    header.cells[3].value = '13.Numero de unidades';
    header.cells[4].value = '14.Peso Unitario (Kg)';
    header.cells[5].value = '15.Toneladas metricas (MT)';

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = 'ID.1.';
    row.cells[1].value = (ipclass.nome[0]==null && ipclass.nome[0]==''?'':ipclass.nome[0]);
    row.cells[2].value = '';
    row.cells[3].value = (ipclass.qty[0]==null && ipclass.qty[0]==''?'':ipclass.qty[0]);
    row.cells[4].value = (ipclass.peso[1]==null && ipclass.peso[0]==''?'':ipclass.peso[0]);
    row.cells[5].value = (ipclass.peso[1]==null && ipclass.peso[0]==''?'':(((double.parse(ipclass.qty[0])+double.parse(ipclass.peso[0]))/1000)).toString());





    if(ipclass.qty.length>1 && ipclass.peso[1]!='' && ipclass.peso[1]!=null ){
      PdfGridRow linha= grid.rows.add();
      linha.cells[0].value = 'ID.2.';
      linha.cells[1].value = (ipclass.nome[1]==null && ipclass.nome[1]==''?'':ipclass.nome[1]);
      linha.cells[2].value = '';
      linha.cells[3].value = (ipclass.qty[1]==null && ipclass.qty[1]==''?'':ipclass.qty[1]);
      linha.cells[4].value = (ipclass.peso[1]==null && ipclass.peso[1]==''?'':ipclass.peso[1]);
      linha.cells[5].value = (ipclass.peso[1]==null && ipclass.peso[1]==''?'':(((double.parse(ipclass.qty[1])+double.parse(ipclass.peso[1]))/1000).toString()));
    }

    if(ipclass.qty.length>2 && ipclass.peso[2]!='' && ipclass.peso[2]!=null ){
      PdfGridRow linha2= grid.rows.add();
      linha2.cells[0].value = 'ID.3.';
      linha2.cells[1].value = (ipclass.nome[2]==null && ipclass.nome[2]==''?'':ipclass.nome[2]);
      linha2.cells[2].value = '';
      linha2.cells[3].value = (ipclass.qty[2]==null && ipclass.qty[2]==''?'':ipclass.qty[2]);
      linha2.cells[4].value = (ipclass.peso[2]==null && ipclass.peso[2]==''?'':ipclass.peso[2]);
      linha2.cells[5].value = (ipclass.peso[2]==null && ipclass.peso[2]==''?'':(((double.parse(ipclass.qty[2])+double.parse(ipclass.peso[2]))/1000).toString()));
    }

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 160, 0, 0));
    //Grid de osbervacoes do despacho
    PdfGrid grid4 = PdfGrid();
    grid4.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 8),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid4.columns.add(count:1);
    PdfGridRow row4 = grid4.rows.add();
    row4.cells[0].value = 'Observacoes do despacho';
    grid4.draw(page: page, bounds: const Rect.fromLTWH(0, 300, 0, 0));
//grid de certificacao dos produtos recebidos
    PdfGrid grid5 = PdfGrid();
    grid5.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 8),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid5.columns.add(count:2);
    grid5.headers.add(1);
    //PdfGridRow header5 = grid5.headers[1];
    PdfGridRow headers5 = grid5.headers[0];
    headers5.cells[0].value="IV.Certificacao de produtos recebidos";
    PdfGridRow row5 = grid5.rows.add();
    row5.cells[0].value = '28.Local';
    row5.cells[1].value = '32.Data de Chegada';
    row5 = grid5.rows.add();
    row5.cells[0].value = '29.Consignatario';
    row5.cells[1].value = '33.Data de inicio da descarga';
    row5 = grid5.rows.add();
    row5.cells[0].value = '30.Nome';
    row5.cells[1].value = '34.Data de fim da descarga';
    row5 = grid5.rows.add();
    row5.cells[0].value = '31.Titulo';
    row5.cells[1].value = '34.Distancia em Km';

    grid5.draw(page: page, bounds:  Rect.fromLTWH(0, 473, 0, 0));
//Observacoes de recepcao
    PdfGrid grid6 = PdfGrid();
    grid6.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 8),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid6.columns.add(count:2);
    grid6.headers.add(1);
    PdfGridRow headers6 = grid6.headers[0];
    headers6.cells[0].value="VI.Observacoes de recepcao";
    PdfGridRow row6 = grid6.rows.add();
    row6.cells[0].value = 'Em representacao do Consignatario,eu abaixo assino e certifico\n recepcao de produtos descritos em,com expecao de possiveis\n perdas ou danos acima mencionados                                                                                                                ';
    row6.cells[1].value = 'Em representacao do Transportador,eu abaixo assino e certifico\n recepcao de produtos descritos em,com expecao de possiveis\n perdas ou danos acima mencionados                                                                                                                ';
    row6 = grid6.rows.add();
    row6.cells[0].value = ' Nome assinatura e Carimbo';
    row6.cells[1].value = 'Por favor endossar esta seccao com carimbo oficial';
    grid6.draw(page:  page, bounds:  Rect.fromLTWH(0, 680, 0, 0));
//grid de certificacao dos produtos perdidos
    PdfGrid grid7= PdfGrid();
    grid7.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 6),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid7.columns.add(count: 8);
    grid7.headers.add(1);
    PdfGridRow header7 = grid7.headers[0];
    // PdfGridRow headers7 = grid7.headers[0];
    //headers7.cells[0].value = "V.Observacoes (Se houver danos ou perdas mencione o PESO, A CAUSA dos danos ou perdas)";
    header7.cells[0].value = 'Numero de SI';
    header7.cells[1].value = 'Liquido Mt inicial';
    header7.cells[2].value = 'Unidade';
    header7.cells[3].value = 'Liquido Mt perdido';
    header7.cells[4].value = 'Perda ou dano (P ou D)';
    header7.cells[5].value = 'Tipo(Especifico)';
    header7.cells[6].value = 'Unidade';
    header7.cells[7].value = 'Liquido Mt recebido';

    PdfGridRow row7 = grid7.rows.add();
    row7.cells[0].value = 'ID.1.';
    row7 = grid7.rows.add();
    row7.cells[0].value = 'ID.2.';
    //row7.cells[1].value = '';
    row7 = grid7.rows.add();
    row7.cells[0].value = 'ID.3.';
    // row7.cells[1].value = '';
    row7 = grid7.rows.add();
    row7.cells[0].value = 'ID.4.';
    //row7.cells[1].value = '';
    row7 = grid7.rows.add();
    row7.cells[0].value = 'ID.5.';
    //  row7.cells[1].value = '';

    grid7.draw(page:page, bounds:  Rect.fromLTWH(0,580, 0, 0));
//titulo do grid 7
    PdfGrid grid8= PdfGrid();
    grid8.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 8),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid8.columns.add(count: 1);
    grid8.headers.add(1);
    PdfGridRow header8 = grid8.headers[0];
    header8.cells[0].value = "V.Observacoes (Se houver danos ou perdas mencione o PESO, A CAUSA dos danos ou perdas)";
    grid8.draw(page:page, bounds:  Rect.fromLTWH(0,562,0, 0));
    //Grid da certificacao de carregamento
    PdfGrid grid9= PdfGrid();
    grid9.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 8),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid9.columns.add(count: 1);
    grid9.headers.add(1);
    PdfGridRow header9 = grid9.headers[0];
    header9.cells[0].value = "III. CERTIFICACAO DE CARREGAMENTO (Por favor endossar esta seccao com carimbo oficial)";
    grid9.draw(page:page, bounds:  Rect.fromLTWH(0,322, 0, 0));
    //Grid de cerficacao de carregamento continuacao
    PdfGrid grid10 = PdfGrid();
    grid10.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 8),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid10.columns.add(count:2);
    PdfGridRow row10 = grid10.rows.add();
    row10.cells[0].value = 'Armazem de despacho ';
    row10.cells[1].value = 'TRANSPORTADOR CONTRATADO';
    row10 = grid10.rows.add();
    row10.cells[0].value = 'Nome';
    row10.cells[1].value = 'TRANSPORTADOR SUB-CONTRATADO';
    row10 = grid10.rows.add();
    row10.cells[0].value = 'Titulo';
    row10.cells[1].value = 'Nome do motorista:';
    row10 = grid10.rows.add();
    row10.cells[0].value = '';
    row10.cells[1].value = 'Carta de Conducao:';
    row10 = grid10.rows.add();
    row10.cells[1].value = 'Matricula do Veiculo:';
    row10 = grid10.rows.add();
    row10.cells[0].value = 'Eu abaixo assinado cerifico o carregamento dos\n produtos acima descriminados (Nome,Assinatura e\n Carimbo)';
    row10.cells[1].value = 'Em representacao do Transportador, eu abaixo assinado certifico a recpcao dos produtos\n acima descriminados, em boas condicoes (Nome,Assinatura e Carimbo)';
    grid10.draw(page:page, bounds:  Rect.fromLTWH(0,340, 0, 0));


    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Ip.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogcontent(context),
    );
  }

  dialogcontent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 100, left: 16, bottom: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Container(
            height: 300,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //content alignment to center
              children: <Widget>[
                Container(
                    child:_image == null
                        ? Container()
                        : Container(
                            child: SizedBox(
                                height: 150,
                                child: Image.file(
                                    _image) //load image from file
                                ))),
                Container(
                    child:_image == null
                        ? Container()
                        : Container(
                            child: RaisedButton.icon(
                            onPressed: () {
                              uploadImage();//start uploading image
                            },
                            icon: Icon(Icons.file_upload),
                            label: Text("Carregar imagem do IP"),
                            color: Colors.red,
                            colorBrightness: Brightness.dark,
                            //set brightness to dark, because deepOrangeAccent is darker coler
                            //so that its text color is light
                          ))),
                Container(
                  child: RaisedButton.icon(
                    onPressed: () {
                      getImage(); // call choose image function
                    },
                    icon: Icon(Icons.folder_open),
                    label: Text("Escolha imagem do IP"),
                    color: Colors.red,
                    colorBrightness: Brightness.dark,
                  ),
                ),
                Container(
                  child: RaisedButton.icon(
                    onPressed: () {
                      List<String> said=new List<String>();

                      print(idS);
                      List<String> produto=nomes.split(',');
                      List<String> qty=quantidade.split(',');
                      List<String> pesos=peso.split(',');

                     IpClass a=new IpClass(produto, 'mize', 'mieze', 'mieze',qty,pesos);
                      _createPDF(a); // call choose image function
                    },
                    icon: Icon(Icons.folder_open),
                    label: Text("Visualizar o IP"),
                    color: Colors.red,
                    colorBrightness: Brightness.dark,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 50,
            //backgroundImage: Ima,
            child: Icon(
              Icons.note,
              color: Colors.white,
            ),
            //backgroundImage: AssetImage("assets/logo1.png"),
          ),
        )
      ],
    );
  }
}
