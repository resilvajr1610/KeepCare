class OpinionsModel{
  String? professionalID;
  String? opinion;
  String? evaluator;
  double? rating;

  OpinionsModel();

  Map<String, dynamic> toJson()=>{
    'professionalID' : professionalID,
    'opinion' : opinion,
    'rating' : rating,
    'evaluator' : evaluator,
  };

  OpinionsModel.fromSnapshot(snapshot):
      professionalID = snapshot.data()['professionalID'],
      opinion = snapshot.data()['opinion'],
      rating = snapshot.data()['rating'],
      evaluator = snapshot.data()['evaluator'];
}