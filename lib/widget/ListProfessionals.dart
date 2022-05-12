import '../Utils/export.dart';

class ListProfessional extends StatelessWidget {

  final bool showAddress;
  final bool showPhone;
  final bool showOpinion;
  final VoidCallback onPressedAddress;
  final VoidCallback onPressedPhone;
  final VoidCallback onPressedOpinion;
  final Color colorAddress;
  final Color colorPhone;
  final Color colorOpinion;

  ListProfessional({
    required this.showAddress,
    required this.showPhone,
    required this.showOpinion,
    required this.onPressedAddress,
    required this.onPressedPhone,
    required this.onPressedOpinion,
    required this.colorAddress,
    required this.colorPhone,
    required this.colorOpinion,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: EdgeInsets.symmetric(vertical: 5),
      child:ListView.separated(
        itemCount: allUsers.length,
        separatorBuilder:(BuildContext context, int index)=> SizedBox(height: 5),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: ()=>Navigator.pushNamed(context, '/detailsProfessionals',arguments: index),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: PaletteColor.greyMedium,
                            radius: 30,
                            backgroundImage: AssetImage(allUsers[index].photo),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 110,
                                  child: Text(allUsers[index].name,
                                    style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(allUsers[index].title,
                                  style: TextStyle(fontFamily: 'Nunito',color: PaletteColor.grey,fontSize: 16,),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          SmoothStarRating(
                            starCount: 5,
                            color: Colors.yellow,
                            rating: allUsers[index].rating.toDouble(),
                            borderColor: Colors.yellow,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        OutlinedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.white,
                              primary: this.colorAddress,
                              minimumSize: Size(60, 30),
                              side: BorderSide(width: 0,color: Colors.white)
                          ),
                          onPressed:this.onPressedAddress,
                          child: Text('Endereços',style: TextStyle(color: PaletteColor.grey,fontSize: 14)),
                        ),
                        OutlinedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.white,
                              primary: this.colorPhone,
                              minimumSize: Size(60, 30),
                              side: BorderSide(width: 0,color: Colors.white)
                          ),
                          onPressed:this.onPressedPhone,
                          child: Text('Telefones',style: TextStyle(color: PaletteColor.grey,fontSize: 14)),
                        ),
                        OutlinedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.white,
                              primary: this.colorOpinion,
                              minimumSize: Size(60, 30),
                              side: BorderSide(width: 0,color: Colors.white)
                          ),
                          onPressed: this.onPressedOpinion,
                          child: Text('Opiniões',style: TextStyle(color: PaletteColor.grey,fontSize: 14)),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: showAddress,
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.2,
                        child: Center(child: Text(allUsers[index].address)),
                      ),
                    ),
                    Visibility(
                      visible: showPhone,
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Center(child: Text(allUsers[index].phone)),
                      ),
                    ),
                    Visibility(
                      visible: showOpinion,
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Center(child: Text(allUsers[index].opinions)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
