import 'package:flutter/material.dart';

import '../Model/export.dart';

class Professionals extends StatefulWidget {
  const Professionals({Key? key}) : super(key: key);

  @override
  _ProfessionalsState createState() => _ProfessionalsState();
}

class _ProfessionalsState extends State<Professionals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.scaffold,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: PaletteColor.primiryColor,
        title: Text('Professionais'),
        titleTextStyle: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on,size: 30),
            onPressed: ()=>Navigator.pushNamed(context, "/map"),
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              ListProfessional(
                name: 'Fulano 1',
                title: 'Título 1',
                rating: 5,
              ),
              ListProfessional(
                name: 'Fulano 2',
                title: 'Título 2',
                rating: 3,
              ),
              ListProfessional(
                name: 'Fulano 3',
                title: 'Título 3',
                rating: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
