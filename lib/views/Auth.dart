import '../Model/export.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _error="";

  _signFirebase()async{

    if (_controllerEmail.text.isNotEmpty) {
      setState(() {
        _error = "";
      });

      try{
        await _auth.signInWithEmailAndPassword(
            email: _controllerEmail.text,
            password: _controllerPassword.text
        ).then((auth)async{
          print("logado");
          Navigator.pushReplacementNamed(context, "/navigation");
        });
      }on FirebaseAuthException catch (e) {
        if(e.code =="unknown"){
          setState(() {
            _error = "A senha está vazia!";
          });
        }else if(e.code =="invalid-email"){
          setState(() {
            _error = "Digite um e-mail válido!";
          });
        }else{
          setState(() {
            _error = e.code;
          });
        }
      }
    } else {
      setState(() {
        _error = "Preencha seu email";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
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
                padding: const EdgeInsets.all(8.0),
                child: Buttons(
                  onPressed: ()=>_signFirebase(),
                  text: "Entrar",
                  icons: Icons.facebook,
                  size: 0,
                  colorButton: PaletteColor.primiryColor,
                  colorIcon: PaletteColor.white,
                  colorText: PaletteColor.white,
                ),
              ),
              InkWell(
                onTap: ()=>Navigator.pushNamed(context, "/login"),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Não tem conta? Cadastre-se!',
                    style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.primiryColor,fontSize: 20,fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              Text(_error,style: TextStyle(color: Colors.red),)
            ],
          ),
        ),
      ),
    );
  }
}
