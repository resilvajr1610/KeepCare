class FavoritesModel{
  int? professionalID;
  String? userID;

  FavoritesModel();

  Map<String, dynamic> toJson()=>{
    'professionalID' : professionalID,
    'userID' : userID,
  };

  FavoritesModel.fromSnapshot(snapshot):
        professionalID = snapshot.data()['professionalID'],
        userID = snapshot.data()['userID'];
}