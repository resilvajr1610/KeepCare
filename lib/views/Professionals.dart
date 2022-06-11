import '../Utils/export.dart';

class Professionals extends StatefulWidget {
  const Professionals({Key? key}) : super(key: key);

  @override
  _ProfessionalsState createState() => _ProfessionalsState();
}

class _ProfessionalsState extends State<Professionals> {

  bool _showAdrress=true;
  bool _showFone=false;
  bool _showOpinion=false;
  Color? _colorAddress;
  Color? _colorPhone;
  Color? colorOpinion;
  Users? users;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PaletteColor.scaffold,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: PaletteColor.primaryColor,
        title: Text('Profissionais'),
        titleTextStyle: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on,size: 30),
            onPressed: ()=>Navigator.pushNamed(context, "/map"),
          )
        ]
      ),
      bottomSheet: MenuSheet(),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    ListProfessional(
                      showAddress: _showAdrress,
                      colorAddress: _colorAddress??PaletteColor.white,
                      onPressedAddress: (){
                        setState(() {
                          _showAdrress= true;
                          _showFone   = false;
                          _showOpinion= false;
                          _colorAddress = PaletteColor.white;
                          _colorPhone = PaletteColor.greyLight;
                          colorOpinion = PaletteColor.greyMedium;
                        });
                      },
                      showPhone: _showFone,
                      colorPhone: _colorPhone??PaletteColor.greyLight,
                      onPressedPhone: (){
                        setState(() {
                          _showAdrress= false;
                          _showFone   = true;
                          _showOpinion= false;
                          _colorAddress = PaletteColor.greyLight;
                          _colorPhone = PaletteColor.white;
                          colorOpinion = PaletteColor.greyMedium;
                        });
                      },
                      showOpinion: _showOpinion,
                      colorOpinion: colorOpinion??PaletteColor.greyMedium,
                      onPressedOpinion: (){
                        setState(() {
                          _showAdrress= false;
                          _showFone   = false;
                          _showOpinion= true;
                          _colorAddress = PaletteColor.greyLight;
                          _colorPhone = PaletteColor.greyMedium;
                          colorOpinion = PaletteColor.white;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
