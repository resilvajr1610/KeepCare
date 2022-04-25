import 'package:flutter/material.dart';
import 'package:keepcare/Model/colors.dart';

class Buttons extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icons;
  final double size;

  Buttons({
    required this.onPressed,
    required this.text,
    required this.icons,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(this.icons,size:this.size),
          style: ElevatedButton.styleFrom(
            primary: PaletteColor.primiryColor
          ),
        onPressed: this.onPressed,
        label: Text(this.text,style: TextStyle(fontFamily: 'Nunito'),)
    );
  }
}
