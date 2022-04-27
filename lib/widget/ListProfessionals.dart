import 'package:flutter/material.dart';
import 'package:keepcare/Model/colors.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class ListProfessional extends StatelessWidget {

  final String name;
  final String title;
  final double rating;
  final String photo;
  final String address;
  final String fone;
  final String opinion;
  final bool showAddress;
  final bool showPhone;
  final bool showOpinion;
  final VoidCallback onPressedAddress;
  final VoidCallback onPressedPhone;
  final VoidCallback onPressedOpinion;
  final Color colorAddress;
  final Color colorPhone;
  final Color colorOpinion;

  ListProfessional({
    required this.name,
    required this.title,
    required this.rating,
    required this.photo,
    required this.address,
    required this.fone,
    required this.opinion,
    required this.showAddress,
    required this.showPhone,
    required this.showOpinion,
    required this.onPressedAddress,
    required this.onPressedPhone,
    required this.onPressedOpinion,
    required this.colorAddress,
    required this.colorPhone,
    required this.colorOpinion,
});

  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 5),
              color: Colors.white,
              child:Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: PaletteColor.greyMedium,
                        radius: 30,
                        backgroundImage: AssetImage(this.photo),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(this.name,
                              style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                            Text(this.title,
                              style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 16,),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      SmoothStarRating(
                        starCount: 5,
                        color: Colors.yellow,
                        rating: this.rating,
                        borderColor: Colors.yellow,
                        size: 15,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.white,
                            primary: this.colorAddress,
                            minimumSize: Size(60, 30),
                            side: BorderSide(width: 0,color: Colors.white)
                        ),
                        onPressed:this.onPressedAddress,
                        child: Text('Endereço',style: TextStyle(color: PaletteColor.grey,fontSize: 14)),
                      ),
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.white,
                            primary: this.colorPhone,
                            minimumSize: Size(60, 30),
                            side: BorderSide(width: 0,color: Colors.white)
                        ),
                        onPressed:this.onPressedPhone,
                        child: Text('Telefone',style: TextStyle(color: PaletteColor.grey,fontSize: 14)),
                      ),
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.white,
                            primary: this.colorOpinion,
                            minimumSize: Size(60, 30),
                            side: BorderSide(width: 0,color: Colors.white)
                        ),
                        onPressed: this.onPressedOpinion,
                        child: Text('Opiniões',style: TextStyle(color: PaletteColor.grey,fontSize: 14)),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: showAddress,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Center(child: Text(this.address)),
                    ),
                  ),
                  Visibility(
                    visible: showPhone,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Center(child: Text(this.fone)),
                    ),
                  ),
                  Visibility(
                    visible: showOpinion,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Center(child: Text(this.opinion)),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
