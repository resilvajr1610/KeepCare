import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utils/export.dart';

class CarrosselProfessionals extends StatelessWidget {

  final String name;
  final String title;
  final String photo;
  final dynamic onTap;

  CarrosselProfessionals({
    required this.name,
    required this.title,
    required this.photo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: this.onTap,
      child: Card(
        child: Container(
          alignment: Alignment.center,
          height: height*0.15,
          width: width*0.5,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(this.photo),
                  backgroundColor: PaletteColor.greyMedium,
                  radius: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      child: Text(this.name,
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 12,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(this.title,
                      style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 10,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
