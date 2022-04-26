import '../Model/export.dart';

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
  final _itemsGender = ['Cisgênero','Transgênero','Não-binário'];
  String? _selectedGender;

  DropdownMenuItem<String>  buildMenuItem(String item)=>DropdownMenuItem(
    value: item,
    child: Text(item),
  );

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: PaletteColor.primiryColor,
          title: Text('Perfil'),
          titleTextStyle: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: PaletteColor.scaffold,
        body:Center(
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
                        color: PaletteColor.primiryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  InputRegister(
                    width: width*0.8,
                    obscure: false,
                    controller: _controllerName,
                    hint: 'Nome',
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
                        color: PaletteColor.primiryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  InputRegister(
                    width: width*0.8,
                    obscure: false,
                    controller: _controllerLastName,
                    hint: 'Sobrenome',
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
                                  color: PaletteColor.primiryColor,
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
                                color: PaletteColor.primiryColor,
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
                        color: PaletteColor.primiryColor,
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
                      onPressed: ()=> Navigator.pushNamed(context, "/search"),
                      text: "Salvar",
                      icons: Icons.facebook,
                      size: 0,
                      colorButton: PaletteColor.primiryColor,
                      colorText: PaletteColor.white,
                      colorIcon: PaletteColor.white,
                    ),
                  ),
                ]),
          ),
        ));
  }
}