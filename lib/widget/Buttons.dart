import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icons;
  final double size;
  final Color color;

  Buttons({
    required this.onPressed,
    required this.text,
    required this.icons,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ElevatedButton.icon(
        icon: Icon(this.icons,size:this.size),
          style: ElevatedButton.styleFrom(
            primary: this.color,
            minimumSize: Size(width*0.8, height*0.07)
          ),
        onPressed: this.onPressed,
        label: Text(this.text,style: TextStyle(fontFamily: 'Nunito'),)
    );
  }
}
