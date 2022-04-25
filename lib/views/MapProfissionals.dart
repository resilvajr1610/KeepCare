import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keepcare/widget/CarrosselProfessionals.dart';

import '../Model/export.dart';

class MapProfissionals extends StatefulWidget {
  const MapProfissionals({Key? key}) : super(key: key);

  @override
  _MapProfissionalsState createState() => _MapProfissionalsState();
}

class _MapProfissionalsState extends State<MapProfissionals> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Container(
                  width: width,
                  height: height*0.6,
                  color: Colors.white,
                ),
              ),
              Container(
                  height: height*0.16,
                  padding: EdgeInsets.all(4),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CarrosselProfessionals(
                        onTap: (){
                          Navigator.pushNamed(context, "/favorites");
                        },
                        name: 'Fulano 1',
                        title: 'Título 1',
                      ),
                      CarrosselProfessionals(
                        onTap: (){
                          Navigator.pushNamed(context, "/favorites");
                        },
                        name: 'Fulano 2',
                        title: 'Título 2',
                      ),
                      CarrosselProfessionals(
                        onTap: (){
                          Navigator.pushNamed(context, "/favorites");
                        },
                        name: 'Fulano 3',
                        title: 'Título 3',
                      ),
                    ],
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
