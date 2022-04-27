import '../Model/export.dart';

class Favorites extends StatefulWidget {
  Users users;
  Favorites(this.users);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  Users? _users;

  @override
  void initState() {
    super.initState();
    _users = widget.users;
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                          backgroundImage: AssetImage(_users!.photo),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_users!.name,
                                style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              Text(_users!.title,
                                style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 16,),
                              ),
                              SmoothStarRating(
                                rating: 4,
                                color: Colors.yellow,
                                borderColor: Colors.yellow,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.favorite,color: PaletteColor.primiryColor,)
                      ],
                    ),
                  ),
                  WidgetFavorites(
                    title: 'Endereço',
                    description: '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Telefone',
                    description: '(303) 555-0105',
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Experiência',
                    description: 'Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim. Elit aute irure tempor cupidatat incididunt sint deserunt ut voluptate aute id deserunt nisi.',
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Opiniões',
                    description: '',
                    ratingList: [
                      Column(
                        children: [
                          Container(
                            child: Text.rich(
                              TextSpan(
                                text: 'Maria Nunes :',
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,fontFamily: 'Nunito',color: PaletteColor.grey),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. ',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
                                  // can add more TextSpans here...
                                ],
                              ),
                            )
                          ),
                          Container(
                              child: Text.rich(
                                TextSpan(
                                  text: 'Maria Nunes :',
                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,fontFamily: 'Nunito',color: PaletteColor.grey),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. ',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
                                    // can add more TextSpans here...
                                  ],
                                ),
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
