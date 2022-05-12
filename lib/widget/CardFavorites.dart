import '../Utils/export.dart';
class CardFavorites extends StatelessWidget {
  final FavoritesModel _favoritesModel;
  CardFavorites(this._favoritesModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: PaletteColor.greyMedium,
                  radius: 30,
                  backgroundImage: AssetImage(allUsers[_favoritesModel.professionalID!].photo),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        child: Text(allUsers[_favoritesModel.professionalID!].name,
                          style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(allUsers[_favoritesModel.professionalID!].title,
                        style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 16,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
