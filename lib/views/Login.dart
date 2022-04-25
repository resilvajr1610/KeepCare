import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keepcare/Model/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.scaffold,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 90,
              width: 90,
              child:Image.asset("assets/logoColor.png"),
            ),
          ],
        ),
      ),
    );
  }
}
