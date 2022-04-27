import '../Model/export.dart';

class MapProfissionals extends StatefulWidget {
  @override
  _MapProfissionalsState createState() => _MapProfissionalsState();
}

class _MapProfissionalsState extends State<MapProfissionals> {

  Users? _users;

  @override
  void initState() {
    super.initState();
    _users = Users();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Container(
                  width: width,
                  height: height*0.6,
                  color: Colors.white,
                ),
              ),
              Container(
                  height: height*0.16,
                  padding: EdgeInsets.all(4),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CarrosselProfessionals(
                        onTap: (){
                          _users!.name = 'Fulano 1';
                          _users!.title = 'Título 1';
                          _users!.photo = "assets/imageProfile1.png";
                          Navigator.pushNamed(context, "/favorites",arguments: _users);
                        },
                        name: 'Fulano 1',
                        title: 'Título 1',
                        photo: "assets/imageProfile1.png",
                      ),
                      CarrosselProfessionals(
                        onTap: (){
                          _users!.name = 'Fulano 2';
                          _users!.title = 'Título 2';
                          _users!.photo = "assets/imageProfile2.png";
                          Navigator.pushNamed(context, "/favorites",arguments: _users);
                        },
                        name: 'Fulano 2',
                        title: 'Título 2',
                        photo: "assets/imageProfile2.png",
                      ),
                      CarrosselProfessionals(
                        onTap: (){
                          _users!.name = 'Fulano 3';
                          _users!.title = 'Título 3';
                          _users!.photo = "assets/imageProfile3.png";
                          Navigator.pushNamed(context, "/favorites",arguments: _users);
                        },
                        name: 'Fulano 3',
                        title: 'Título 3',
                        photo: "assets/imageProfile3.png",
                      ),
                    ],
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
