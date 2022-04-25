import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        height: height*0.07,
        width: width*0.8,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/google.png'),
            SizedBox(width: 20),
            Text('Entrar com Google',style: TextStyle(fontFamily: 'Nunito',color: Color(0xff575757),fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
