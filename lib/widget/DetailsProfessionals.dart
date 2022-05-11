import '../Utils/export.dart';

class DetailsProfessionals extends StatefulWidget {
  int index;
  DetailsProfessionals(this.index);
  @override
  _DetailsProfessionalsState createState() => _DetailsProfessionalsState();
}

class _DetailsProfessionalsState extends State<DetailsProfessionals> {

  int user=0;

  @override
  void initState() {
    super.initState();
    user = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.scaffold,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: PaletteColor.primiryColor,
        title: Text('Detalhes'),
        titleTextStyle: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
      bottomSheet: MenuSheet(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 75),
            child: Card(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    color: PaletteColor.greyLight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: PaletteColor.greyMedium,
                          backgroundImage: AssetImage(usersList[user].photo),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(usersList[user].name,
                                style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              Text(usersList[user].title,
                                style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 16,),
                              ),
                              SmoothStarRating(
                                rating: usersList[user].rating.toDouble(),
                                color: Colors.yellow,
                                borderColor: Colors.yellow,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.favorite_border,color: PaletteColor.primiryColor,)
                      ],
                    ),
                  ),
                  WidgetFavorites(
                    title: 'Endereço',
                    description: usersList[user].address,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Telefone',
                    description: usersList[user].phone,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Subespecialidade',
                    description: usersList[user].subtitle,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Tratar condições médicas',
                    description: usersList[user].condicions,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Formação',
                    description: usersList[user].formations,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Idiomas',
                    description: usersList[user].languages,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Opiniões',
                    description: 'Sem avaliações',
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
