import 'package:flutter/material.dart';
import '../Model/export.dart';

class WidgetFavorites extends StatelessWidget {

  final String title;
  final String description;
  final List<Widget> ratingList;

  WidgetFavorites({
   required this.title,
   required this.description,
   required this.ratingList,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8),
          child: Text(this.title,
            style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 14,fontWeight: FontWeight.bold),
          ),
        ),
        this.description!=""?Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(this.description,
            style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 12),
          ),
        ):Container(),
        this.ratingList.length!=0?Container(
          height: this.ratingList.length*120,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: this.ratingList,
          ),
        ):SizedBox(height: 0),
      ],
    );
  }
}
