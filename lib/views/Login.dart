import '../Utils/export.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool check = false;
  String _error="";

  _saveFirebase()async{

    if(_controllerName.text.isNotEmpty&&_controllerName.text.contains(" ")){
      if (_controllerEmail.text.isNotEmpty) {
        setState(() {
          _error = "";
        });

        try{
          await _auth.createUserWithEmailAndPassword(
              email: _controllerEmail.text,
              password: _controllerPassword.text
          ).then((auth)async{

            User? user = FirebaseAuth.instance.currentUser;
            user?.updateDisplayName(_controllerName.text);

            Navigator.pushReplacementNamed(context, "/navigation");
          });
        }on FirebaseAuthException catch (e) {
          if(e.code =="weak-password"){
            setState(() {
              _error = "Digite uma senha mais forte!";
            });
          }else if(e.code =="unknown"){
            setState(() {
              _error = "A senha está vazia!";
            });
          }else if(e.code =="invalid-email"){
            setState(() {
              _error = "Digite um e-mail válido!";
            });
          }else if(e.code =="email-already-in-use"){
            setState(() {
              _error = "Esse e-mail já está cadastrado!";
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
    }else{
      setState(() {
        _error = "Preencha seu nome e Sobrenome";
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
              Buttons(
                  onPressed:()=>check?signInFacebook(context):showSnackBar(context, 'Leia e concorde com os termos e condições de uso para avançar',_scaffoldKey),
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
                    check?provider.googleLogin().then((_) => Navigator.pushReplacementNamed(context, "/search"))
                        :showSnackBar(context, 'Leia e concorde com os termos e condições de uso para avançar',_scaffoldKey);
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
                controller: _controllerName,
                hint: 'Informe seu nome e Sobrenome',
                fonts: 14,
                keyboardType: TextInputType.text,
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
                  onPressed: ()=>check?_saveFirebase()
                      :showSnackBar(context, 'Leia e concorde com os termos e condições de uso para avançar',_scaffoldKey),
                  text: "Criar conta",
                  icons: Icons.facebook,
                  size: 0,
                  colorButton: PaletteColor.primiryColor,
                  colorIcon: PaletteColor.white,
                  colorText: PaletteColor.white,
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
