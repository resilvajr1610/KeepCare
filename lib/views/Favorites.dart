import '../Utils/export.dart';

class Favorites extends StatefulWidget {

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Object> _historyList=[];

  Future _data()async{

    var data = await db.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).collection("favorites").get();
    setState(() {
      _historyList = List.from(data.docs.map((doc)=>FavoritesModel.fromSnapshot(doc)));
    });

  }

  @override
  void initState() {
    super.initState();
    _data();
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
        title: Text('Favoritos'),
        titleTextStyle: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
      bottomSheet: MenuSheet(),
      body:  Container(
        padding: EdgeInsets.all(8),
        color: PaletteColor.scaffold,
        height: height*0.9,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _historyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: PaletteColor.scaffold,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/detailsProfessionals',arguments: index);
                        },
                        child: CardFavorites(_historyList[index] as FavoritesModel)
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
