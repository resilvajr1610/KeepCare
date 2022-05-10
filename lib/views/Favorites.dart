import '../Utils/export.dart';

class Favorites extends StatefulWidget {

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

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
      body: Text("Fav")
    );
  }
}
