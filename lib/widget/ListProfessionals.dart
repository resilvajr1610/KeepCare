import 'package:flutter/material.dart';
import 'package:keepcare/Model/colors.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class ListProfessional extends StatelessWidget {

  final String name;
  final String title;
  final double rating;

  ListProfessional({
    required this.name,
    required this.title,
    required this.rating
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
                            primary: Colors.white,
                            minimumSize: Size(60, 30),
                            side: BorderSide(width: 0,color: Colors.white)
                        ),
                        onPressed: (){},
                        child: Text('Endereço',style: TextStyle(color: PaletteColor.grey,fontSize: 14)),
                      ),
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.white,
                            primary: PaletteColor.greyLight,
                            minimumSize: Size(60, 30),
                            side: BorderSide(width: 0,color: Colors.white)
                        ),
                        onPressed: (){},
                        child: Text('Telefone',style: TextStyle(color: PaletteColor.grey,fontSize: 14)),
                      ),
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.white,
                            primary: PaletteColor.greyMedium,
                            minimumSize: Size(60, 30),
                            side: BorderSide(width: 0,color: Colors.white)
                        ),
                        onPressed: (){},
                        child: Text('Opiniões',style: TextStyle(color: PaletteColor.grey,fontSize: 14)),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                  )
                ],
              ),
            ),
          );
  }
}
