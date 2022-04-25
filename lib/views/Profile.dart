import 'dart:async';
import 'package:flutter/material.dart';
import '../Model/export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final _controllerGender = StreamController<QuerySnapshot>.broadcast();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  var _selectedGender;

  Widget stream(final controller) {
    return StreamBuilder<QuerySnapshot>(
      stream:controller.stream,
      builder: (context,snapshot){

        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container();
            break;
          case ConnectionState.active:
          case ConnectionState.done:

            if(snapshot.hasError)
              return Text("Erro ao carregar dados!");

            if(!snapshot.hasData){
              return Container();
            }else {
              List<DropdownMenuItem> espItems = [];
              for (int i = 0; i < snapshot.data!.docs.length;i++){
                DocumentSnapshot snap=snapshot.data!.docs[i];
                espItems.add(
                    DropdownMenuItem(
                      child: Text(
                        snap.id,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: PaletteColor.grey),
                      ),
                      value: "${snap.id}",
                    )
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<dynamic>(
                    items:espItems,
                    onChanged:(value){
                      setState(() {
                        _selectedGender = value.toString();
                      });
                    },
                    value: _selectedGender,
                    isExpanded: false,
                    hint: new Text(
                      "Selecione",
                      style: TextStyle(color: PaletteColor.grey ),
                    ),
                  ),
                ],
              );
            }

        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: PaletteColor.primiryColor,
          title: Text('Perfil'),
          titleTextStyle: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: PaletteColor.scaffold,
        body:Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Nome",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: PaletteColor.primiryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  InputRegister(
                    width: width*0.8,
                    obscure: false,
                    controller: _controllerName,
                    hint: 'Nome',
                    fonts: 14,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Sobrenome",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: PaletteColor.primiryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  InputRegister(
                    width: width*0.8,
                    obscure: false,
                    controller: _controllerLastName,
                    hint: 'Sobrenome',
                    fonts: 14,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: width*0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Gênero",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: PaletteColor.primiryColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            DropdownItens(
                                streamBuilder: stream(_controllerGender),
                                onChanged: (){},
                                selected: "",
                                width: width*0.35
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Data de nascimento",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                color: PaletteColor.primiryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InputRegister(
                              width: width*0.35,
                              obscure: false,
                              controller: _controllerDate,
                              hint: '00/00/0000',
                              fonts: 14,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Cidade",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: PaletteColor.primiryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  InputRegister(
                    width: width*0.8,
                    obscure: false,
                    controller: _controllerCity,
                    hint: 'Cidade',
                    fonts: 14,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Buttons(
                      onPressed: ()=> Navigator.pushNamed(context, "/search"),
                      text: "Salvar",
                      icons: Icons.facebook,
                      size: 0,
                      color: PaletteColor.primiryColor,
                    ),
                  ),
                ]),
          ),
        ));
  }
}
