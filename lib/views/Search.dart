import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import '../Model/export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final _controllerGender = StreamController<QuerySnapshot>.broadcast();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  double _rating = 4;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: PaletteColor.primiryColor,
          title: Text('Procurar Profissional'),
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
                  InputRegister(
                    width: width*0.8,
                    obscure: false,
                    controller: _controllerName,
                    hint: 'Especialidade',
                    fonts: 14,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  InputRegister(
                    width: width*0.8,
                    obscure: false,
                    controller: _controllerLastName,
                    hint: 'Subespecialidade',
                    fonts: 14,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  InputRegister(
                    width: width*0.8,
                    obscure: false,
                    controller: _controllerCity,
                    hint: 'Local',
                    fonts: 14,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Nota",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: PaletteColor.primiryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SmoothStarRating(
                        size: 20,
                        color: Color(0xfff9a72b),
                        borderColor: Color(0xfff9a72b),
                        starCount: 5,
                        rating: _rating,
                        onRatingChanged: (valor){
                          setState(() {
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Buttons(
                      onPressed: ()=>Navigator.pushNamed(context, "/professionals"),
                      text: "Pesquisar",
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
