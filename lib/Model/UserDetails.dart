class UserDetails{
  String? id;
  String? displayName;
  String? email;
  String? photoUrl;

  UserDetails({
    this.id,
    this.displayName,
    this.email,
    this.photoUrl
});

  UserDetails.fromJson(Map<String, dynamic> json){
    id = json["id"];
    displayName = json["displayName"];
    email = json["email"];
    photoUrl = json["photoUrl"];
  }
  Map<String,dynamic>toJson(){

   Map<String,dynamic> data = new Map<String,dynamic>();
   data['id'] = this.id;
   data['displayName'] = this.displayName;
   data['email'] = this.email;
   data['photoUrl'] = this.photoUrl;

   return data;
  }
}