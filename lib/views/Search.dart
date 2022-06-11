import '../Utils/export.dart';
import 'package:google_place/google_place.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  double _rating = 0;
  String? specialty;
  String? subspecialty;
  final itemsSpecialty=["Nutricionista"];
  late GooglePlace googlePlace;
  TextEditingController _controllerPlaces = TextEditingController();
  List<AutocompletePrediction> predictions=[];
  Timer? _debounce;
  DetailsResult? startPosition;
  late FocusNode? startFocusNode;
  String apikey='AIzaSyBbZH6hcWDm4XjILgjopeWJFoa7Gkdnvfc';
  late List<Users> users;

  void autoCompleteSearch(String value)async{
    var result = await googlePlace.autocomplete.get(value);
    if(result!= null && result.predictions !=null && mounted){
      print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  void search(String query){
    final listSearch = allUsers.where((users){
      final subtitleLower = users.subtitle.toLowerCase();
      final titleLower = users.title.toLowerCase();
      final addressLower = users.address.toLowerCase();
      final ratingLower = users.rating.toString().toLowerCase();
      final search = query.toLowerCase();

      return subtitleLower.contains(search) || titleLower.contains(search)|| addressLower.contains(search)|| ratingLower.contains(search);
    }).toList();

    setState(() {
      this.users = listSearch;
    });
  }

  @override
  void initState() {
    super.initState();
    users = allUsers;
    googlePlace = GooglePlace(apikey);
    startFocusNode=FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    startFocusNode?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    DropdownMenuItem<String> buildMenuItemSpecialty(String item)=>
        DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: TextStyle(color: Colors.grey),
            ),
        );

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: PaletteColor.primaryColor,
          title: Text('Procurar Profissional'),
          titleTextStyle: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: PaletteColor.scaffold,
        bottomSheet: MenuSheet(),
        body:Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: width*0.8,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                      child: DropdownButton<String>(
                          hint: Text('Especialidade',style: TextStyle(color: PaletteColor.primirySecundary)),
                          isExpanded: true,
                          underline: Container(),
                          items: itemsSpecialty.map(buildMenuItemSpecialty).toList(),
                          value: specialty,
                          onChanged: (value){
                            setState(() {
                              this.specialty=value.toString();
                            });
                          }
                      )
                  ),
                  SizedBox(height: 10),
                  Container(
                      width: width*0.8,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: SingleChildScrollView(
                        child: DropdownButton<String>(
                            hint: Text('Subespecialidade',style: TextStyle(color: PaletteColor.primirySecundary)),
                            isExpanded: true,
                            underline: Container(),
                            items: itemsSubpecialty.map(buildMenuItemSpecialty).toList(),
                            value: subspecialty,
                            onChanged: (value){
                              setState(() {
                                this.subspecialty=value.toString();
                                search(this.subspecialty.toString());
                              });
                            }
                        ),
                      )
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: width*0.8,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextFormField(
                      onChanged: (value){
                        if(_debounce?.isActive ?? false) _debounce!.cancel();
                        _debounce = Timer(const Duration(milliseconds: 1000),(){
                          if(value.isNotEmpty){
                            autoCompleteSearch(value);
                          }
                        });
                      },
                      controller: _controllerPlaces,
                      focusNode: startFocusNode,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(
                        color: PaletteColor.primirySecundary,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Local',
                          hintStyle: TextStyle(
                            color: PaletteColor.primirySecundary,
                            fontSize: 16,
                          )
                      ),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: predictions.length,
                      itemBuilder: (context, index){
                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.white,
                          child: ListTile(
                            leading: Icon(Icons.location_on,color: PaletteColor.primaryColor,),
                            title: Text(predictions[index].description.toString()),
                            onTap: ()async{
                              final placeId = predictions[index].placeId;
                              final details = await googlePlace.details.get(placeId!);
                              if(details!=null && details.result !=null && mounted){
                                setState(() {
                                  startPosition = details.result;
                                  _controllerPlaces.text = details.result!.name!;
                                  print('aaaaaaaaaaaaaaaaaaa:' +_controllerPlaces.text);
                                  predictions=[];
                                  search(_controllerPlaces.text);
                                });
                              }
                            },
                          ),
                        );
                      }),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Nota",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: PaletteColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SmoothStarRating(
                        size: 20,
                        color: Color(0xfff9a72b),
                        borderColor: Color(0xfff9a72b),
                        starCount: 5,
                        rating: _rating,
                        onRatingChanged: (valor){
                          setState(() {
                            _rating = valor;
                            search(_rating.toString());
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: PaletteColor.scaffold,
                    height: 250,
                    child: Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: users.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    color: PaletteColor.scaffold,
                                    padding: EdgeInsets.symmetric(horizontal: width*0.1),
                                    child: GestureDetector(
                                      onTap: ()=>Navigator.pushNamed(context, '/detailsProfessionals',arguments: index),
                                      child: Card(
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
                                                    backgroundImage: AssetImage(users[index].photo),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          width: 200,
                                                          child: Text(users[index].name,
                                                            style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 16,fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                        Text(users[index].title,
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
                                      ),
                                    ),
                                  );
                                }
                            ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(height: 20),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Buttons(
                  //     onPressed: ()=>Navigator.pushNamed(context, "/professionals"),
                  //     text: "Pesquisar",
                  //     icons: Icons.facebook,
                  //     size: 0,
                  //     colorButton: PaletteColor.primiryColor,
                  //     colorIcon: PaletteColor.white,
                  //     colorText: PaletteColor.white,
                  //   ),
                  // ),
                  SizedBox(height: 40),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                  //   child: Buttons(
                  //     onPressed: ()=>Navigator.pushNamed(context, "/professionals"),
                  //     text: "Todos profissionais",
                  //     icons: Icons.facebook,
                  //     size: 0,
                  //     colorButton: PaletteColor.primiryColor,
                  //     colorIcon: PaletteColor.white,
                  //     colorText: PaletteColor.white,
                  //   ),
                  // ),
                ]),
          ),
        ));
  }
}
