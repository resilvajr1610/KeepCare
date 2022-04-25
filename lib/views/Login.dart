import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Model/export.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  bool check = false;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: PaletteColor.scaffold,
      body: Center(
        child: SingleChildScrollView(
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
              Buttons(
                  onPressed: (){},
                  text: 'Entrar com Facebook',
                  icons: Icons.facebook,
                  size: 20,
                  color: PaletteColor.blueFacebook,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GoogleButton(),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('ou',
                  style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.primiryColor,fontSize: 20),
                ),
              ),
              InputRegister(
                  width: width*0.8,
                  obscure: false,
                  controller: _controllerEmail,
                  hint: 'Informe seu e-mail',
                  fonts: 14,
                  keyboardType: TextInputType.emailAddress,
              ),
              InputRegister(
                width: width*0.8,
                obscure: true,
                controller: _controllerPassword,
                hint: 'Informe sua senha',
                fonts: 14,
                keyboardType: TextInputType.visiblePassword,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: PaletteColor.primiryColor,
                      ),
                      child: Checkbox(
                          value: check,
                          checkColor: PaletteColor.primiryColor,
                          activeColor: Colors.transparent,
                          onChanged: (value){
                          setState(() {
                            check = value!;
                          });
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: width*0.7,
                        child: Text('Li e concordo com os Termos e condições de uso',
                          style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.primiryColor,fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Buttons(
                  onPressed: ()=>Navigator.pushNamed(context, "/profile"),//Navigator.pushNamed(context, '/login'),
                  text: "Criar conta",
                  icons: Icons.facebook,
                  size: 0,
                  color: PaletteColor.primiryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
