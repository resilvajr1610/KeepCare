import 'dart:convert';

import '../Model/export.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  bool check = false;

  void _signInFacebook()async{
    try {
      final LoginResult result = await FacebookAuth.instance.login(permissions: (['email', 'public_profile']));
      final token = result.accessToken!.token;
      print('Facebook token userID : ${result.accessToken!.grantedPermissions}');
      final graphResponse = await http.get(Uri.parse( 'https://graph.facebook.com/'
          'v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));

      final profile = jsonDecode(graphResponse.body);
      print("Profile is equal to $profile");
      try {
        final AuthCredential facebookCredential = FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookCredential);
        Navigator.pushReplacementNamed(context, "/navigation");
      }catch(e)
      {
        final snackBar = SnackBar(
          margin: const EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
          content:  Text(e.toString()),
          backgroundColor: (Colors.redAccent),
          action: SnackBarAction(
            label: 'dismiss',
            onPressed: () {
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

    } catch (e) {
      print("error occurred");
      print(e.toString());
    }
  }

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
                  onPressed: _signInFacebook,
                  text: 'Entrar com Facebook',
                  icons: Icons.facebook,
                  size: 20,
                  colorButton: PaletteColor.blueFacebook,
                  colorIcon: PaletteColor.white,
                  colorText: PaletteColor.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Buttons(
                  onPressed: (){
                    final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                    provider.googleLogin().then((_) => Navigator.pushReplacementNamed(context, "/navigation"));
                  },
                  text: 'Entrar com Google',
                  icons: FontAwesomeIcons.google,
                  size: 18,
                  colorButton: PaletteColor.white,
                  colorText: PaletteColor.grey,
                  colorIcon: Colors.red,
                ),
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
                  onPressed: ()=>Navigator.pushNamed(context, "/navigation"),
                  text: "Criar conta",
                  icons: Icons.facebook,
                  size: 0,
                  colorButton: PaletteColor.primiryColor,
                  colorIcon: PaletteColor.white,
                  colorText: PaletteColor.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
