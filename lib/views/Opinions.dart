import '../Utils/export.dart';

class Opinions extends StatefulWidget {
  int professionalID;
  Opinions(this.professionalID);

  @override
  _OpinionsState createState() => _OpinionsState();
}

class _OpinionsState extends State<Opinions> {

  TextEditingController _controllerOpinion = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double rating=0.0;
  Users? _users;

  DropdownMenuItem<String>  buildMenuItem(String item)=>DropdownMenuItem(
    value: item,
    child: Text(item),
  );

  _updateUsers(){

    _users = Users.createId(widget.professionalID.toString());

      db.collection("rating").doc(_users!.idRating).set({
        "opinion": _controllerOpinion.text,
        "rating" : rating,
        "professionalID":widget.professionalID.toString(),
        "evaluator": FirebaseAuth.instance.currentUser?.displayName!
      }).then((_) {
            Navigator.pushReplacementNamed(context, "/search");
      });
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: PaletteColor.primiryColor,
          title: Text('Opiniões'),
          titleTextStyle: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
        bottomSheet: MenuSheet(),
        backgroundColor: PaletteColor.scaffold,
        body:SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                  child: Text(
                    "Avalie o trabalho realizado por :\n ${allUsers[widget.professionalID].name}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: PaletteColor.primiryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: height*0.2,
                  width: width*0.8,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  decoration: BoxDecoration(
                    color: PaletteColor.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    minLines: 3,
                    maxLines: 5,
                    controller: _controllerOpinion,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.text,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(
                      color: PaletteColor.primirySecundary,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Avalie',
                        hintStyle: TextStyle(
                          color: PaletteColor.primirySecundary,
                          fontSize: 16,
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Nota : ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          color: PaletteColor.primiryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SmoothStarRating(
                      rating: rating,
                      color: Colors.yellow,
                      borderColor: Colors.yellow,
                      size: 30,
                      onRatingChanged: (value){
                        setState(() {
                          rating = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Buttons(
                    onPressed: (){
                      if(_controllerOpinion.text.isNotEmpty && rating!= 0.0) {
                        _updateUsers();
                      }else{
                        showSnackBar(context, 'Preencha todos os campos corretamente',_scaffoldKey);
                      }
                    },
                    text: "Avaliar",
                    icons: Icons.facebook,
                    size: 0,
                    colorButton: PaletteColor.primiryColor,
                    colorText: PaletteColor.white,
                    colorIcon: PaletteColor.white,
                  ),
                ),
              ]),
        ));
  }
}
