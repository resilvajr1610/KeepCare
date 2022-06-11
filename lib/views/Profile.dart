import '../Utils/export.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  final _itemsGender = ['Cisgênero','Transgênero','Não-binário'];
  String? _selectedGender;
  UserDetails? userDetails;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _updating = false;

  DropdownMenuItem<String>  buildMenuItem(String item)=>DropdownMenuItem(
    value: item,
    child: Text(item),
  );

  _updateUsers(){

    if(_controllerName.text.isNotEmpty && _controllerLastName.text.isNotEmpty && _controllerCity.text.isNotEmpty && _controllerDate.text.isNotEmpty) {
      db.collection("users").doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "gender": _selectedGender,
        "date": _controllerDate.text,
        "city": _controllerCity.text
      })
          .then((value) {
        User? user = FirebaseAuth.instance.currentUser;
        user?.updateDisplayName(
            _controllerName.text + " " + _controllerLastName.text);
        setState(() {
          _updating=false;
        });
      });
    }
  }

  _loadingData()async{
    userDetails = UserDetails();
    setState(() {
      _controllerName = TextEditingController(text: FirebaseAuth.instance.currentUser!=null? FirebaseAuth.instance.currentUser!.displayName?.split(" ").first:"");
      _controllerLastName = TextEditingController(text: FirebaseAuth.instance.currentUser!=null? FirebaseAuth.instance.currentUser!.displayName?.split(" ").last:"");
    });

    DocumentSnapshot snapshot = await db.collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    Map<String,dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      _selectedGender = data?["gender"]??"";
      _controllerDate = TextEditingController(text: data?["date"]??"");
      _controllerCity = TextEditingController(text: data?["city"]??"");

    });
  }

  @override
  void initState() {
    super.initState();
    _loadingData();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: PaletteColor.primaryColor,
          title: Text('Perfil'),
          titleTextStyle: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
          actions: [
            InkWell(
              onTap: (){
                final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                provider.googleLogout().then((_) => Navigator.pushReplacementNamed(context, "/home"));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.logout),
              ),
            )
          ],
        ),
        bottomSheet: MenuSheet(),
        backgroundColor: PaletteColor.scaffold,
        body:_updating?Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Enviando...',style: TextStyle(color: PaletteColor.primaryColor),),
              ),
              CircularProgressIndicator(color: PaletteColor.primaryColor,),
            ],
          ),
        ):Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Nome",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: PaletteColor.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  InputRegister(
                    width: width*0.8,
                    obscure: false,
                    controller: _controllerName,
                    hint: "Nome",
                    fonts: 14,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Sobrenome",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: PaletteColor.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  InputRegister(
                    width: width*0.8,
                    obscure: false,
                    controller: _controllerLastName,
                    hint: "Sobrenome",
                    fonts: 14,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: width*0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Gênero",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: PaletteColor.primaryColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              height: height*0.07,
                              width: width*0.35,
                              decoration: BoxDecoration(
                                color: PaletteColor.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  alignment: Alignment.center,
                                  value: _selectedGender,
                                  hint: Text("Gênero",style: TextStyle(fontSize: 12)),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12
                                  ),
                                  items: _itemsGender.map(buildMenuItem).toList(),
                                  onChanged: (value) => setState(() => _selectedGender = value.toString()),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Data de nascimento",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                color: PaletteColor.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InputRegister(
                              width: width*0.35,
                              obscure: false,
                              controller: _controllerDate,
                              hint: '00/00/0000',
                              fonts: 14,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                DataInputFormatter()
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Cidade",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: PaletteColor.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  InputRegister(
                    width: width*0.8,
                    obscure: false,
                    controller: _controllerCity,
                    hint: 'Cidade',
                    fonts: 14,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Buttons(
                      onPressed: (){
                         if(_controllerName.text.isNotEmpty
                            && _controllerLastName.text.isNotEmpty
                            && _controllerCity.text.isNotEmpty
                            && _controllerDate.text.isNotEmpty) {
                           setState(() {
                             _updating=true;
                           });
                           _updateUsers();
                         }else{
                           showSnackBar(context, 'Preencha todos os campos corretamente',_scaffoldKey);
                         }
                      },
                      text: "Atualizar",
                      icons: Icons.facebook,
                      size: 0,
                      colorButton: PaletteColor.primaryColor,
                      colorText: PaletteColor.white,
                      colorIcon: PaletteColor.white,
                    ),
                  ),
                ]),
          ),
        ));
  }
}
