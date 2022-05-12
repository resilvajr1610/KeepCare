import '../Utils/export.dart';

class Users{

  int id = 0;
  String idRating = "";
  String email = "";
  String name = "";
  String title = "";
  double rating = 0;
  String photo = "";
  String address = "";
  String phone = "";
  String subtitle = "";
  String condicions = "";
  String formations = "";
  String languages = "";
  String opinions = "";
  double lat = 0;
  double lon = 0;

  Users({
    required this.id,
    required this.email,
    required this.name,
    required this.title,
    required this.rating,
    required this.photo,
    required this.address,
    required this.phone,
    required this.subtitle,
    required this.condicions,
    required this.formations,
    required this.languages,
    required this.opinions,
    required this.lat,
    required this.lon,
});

  Users.createId(String ProfessionalID){
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference rating = db.collection("rating").doc(ProfessionalID).collection("rating");
    this.idRating = rating.doc().id.toString();
  }
}