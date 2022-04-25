import 'package:flutter/material.dart';
import 'package:keepcare/widget/Buttons.dart';
import '../Model/export.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.scaffold,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Bem-vindo a',
              style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.primiryColor,fontSize: 32),
            ),
            SizedBox(
              height: 180,
              width: 182,
              child:Image.asset("assets/logoColor.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Buttons(
                  onPressed: ()=>Navigator.pushNamed(context, '/login'),
                  text: "Comece agora",
                  icons: Icons.facebook,
                  size: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Já possui uma conta?',
                style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Entrar',
                style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.primiryColor,fontSize: 20,fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
