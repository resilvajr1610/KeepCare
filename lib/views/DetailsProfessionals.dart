import '../Utils/export.dart';

class DetailsProfessionals extends StatefulWidget {
  int index;
  DetailsProfessionals({required this.index});
  @override
  _DetailsProfessionalsState createState() => _DetailsProfessionalsState();
}

class _DetailsProfessionalsState extends State<DetailsProfessionals> {

  int user=0;
  bool favorite=false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<Object> _historyList=[];
  int divisor=0;
  double rating=0.0;

  _saveFavorite(int id){

    String? user = auth.currentUser?.uid;

    db.collection("users").doc(user).collection('favorites').doc(id.toString()).set({
      "professionalID": id,
      'userID':user
    });
  }
  _deleteFavorite(int id){

    String? user = auth.currentUser?.uid;

    db.collection("users").doc(user).collection('favorites').doc(id.toString()).delete();
  }

  Future _data()async{

    var data = await db.collection("rating").where("professionalID",isEqualTo: widget.index.toString()).get();
    setState(() {
      _historyList = List.from(data.docs.map((doc)=>OpinionsModel.fromSnapshot(doc)));
      divisor=data.size;
    });

    db.collection("rating").where("professionalID",isEqualTo: widget.index.toString()).snapshots().listen((snapshot) {
      double total = 0;
      for (DocumentSnapshot item in snapshot.docs) {
        var dados = item;
        total += dados['rating'];
        rating = total / divisor;
      }
    });

  }

  @override
  void initState() {
    super.initState();
    user = widget.index;
    _data();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
        backgroundColor: PaletteColor.primaryColor,
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
                          backgroundImage: AssetImage(allUsers[user].photo),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(allUsers[user].name,
                                style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 16,fontWeight: FontWeight.bold),
                              ),
                              Text(allUsers[user].title,
                                style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 12,),
                              ),
                              Container(
                                width: width*0.45,
                                child: Row(
                                  children: [
                                    SmoothStarRating(
                                      rating: rating,
                                      color: Colors.orangeAccent,
                                      borderColor: Colors.orangeAccent,
                                      size: 16,
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: ()=>Navigator.pushNamed(context, '/opinions',arguments: user),
                                      child: Text('Avaliar',
                                          style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.primaryColor,fontSize: 16,fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: ()=>setState(() {
                              if(favorite==false){
                                favorite=true;
                                _saveFavorite(user);
                              }else{
                                favorite=false;
                                _deleteFavorite(user);
                              }
                            }),
                            child: Icon(favorite?Icons.favorite:Icons.favorite_border,color: PaletteColor.primaryColor,)
                        )
                      ],
                    ),
                  ),
                  WidgetFavorites(
                    title: 'Endereço',
                    description: allUsers[user].address,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Telefone',
                    description: allUsers[user].phone,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Subespecialidade',
                    description: allUsers[user].subtitle,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Tratar condições médicas',
                    description: allUsers[user].condicions,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Formação',
                    description: allUsers[user].formations,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Idiomas',
                    description: allUsers[user].languages,
                    ratingList: [],
                  ),
                  Divider(endIndent: 10,indent: 10),
                  WidgetFavorites(
                    title: 'Opiniões',
                    description: '',
                    ratingList: [
                      _historyList.length!=0?Container(
                        height: height * 0.5,
                        width: width*0.7,
                        child: ListView.builder(
                            itemCount: _historyList.length,
                            itemBuilder: (context,index){
                              return ContainerOpinion(_historyList[index] as OpinionsModel);
                            },
                        ),
                      ):Text('Sem avaliações',style: TextStyle(color: PaletteColor.grey),),
                    ],
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
