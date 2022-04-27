import '../Model/export.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.scaffold,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: PaletteColor.primiryColor,
        title: Text('Professionais'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              ListProfessional(
                name: 'Fulano 1',
                title: 'Título 1',
                photo: "assets/imageProfile1.png",
                address: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                fone: "(303) 555-0105",
                opinion: "Maria Nunes: Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. ",
                rating: 5,
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
      ),
    );
  }
}
