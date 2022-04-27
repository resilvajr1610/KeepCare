class Users{

  String _id = "";
  String _email = "";
  String _name = "";
  String _title = "";
  String _rating = "";
  String _photo = "";

  Users();

  String get photo => _photo;

  set photo(String value) {
    _photo = value;
  }

  String get rating => _rating;

  set rating(String value) {
    _rating = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}