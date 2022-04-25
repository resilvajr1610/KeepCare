import 'package:flutter/material.dart';
import '../Model/export.dart';

class DropdownItens extends StatelessWidget {

  final Widget streamBuilder;
  final String selected;
  final dynamic onChanged;
  final double width;

  DropdownItens({
    required this.streamBuilder,
    required this.onChanged,
    required this.selected,
    required this.width
});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Container(
        decoration: BoxDecoration(
          color: PaletteColor.white,
          borderRadius: BorderRadius.circular(5),
        ),
        height: height*0.07,
        width: this.width,
        child: DropdownButtonHideUnderline(
          child: streamBuilder!=null
              ?this.streamBuilder
              :DropdownButton(
            iconSize: 40,
            isExpanded: true,
            value: this.selected,
            hint: Text("Selecione",style: TextStyle(fontSize: 15)),
            style: TextStyle(
                color: Colors.black,
                fontSize: 12
            ),
            onChanged: onChanged, items: [],
          ),
        )
    );
  }
}
