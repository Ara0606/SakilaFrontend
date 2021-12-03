//{
//     "filmId": 978,
//     "title": "WISDOM WORKER",
//     "description": "A Unbelieveable Saga of a Forensic Psychologist And a Student who must Face a Squirrel in The First Manned Space Station",
//     "releaseYear": 2006,
//     "cost": 12.99,
//     "stock": 3,
//     "length": null,
//     "actors": null
//   },

class Film{
  int _id;
  String _title;
  String _description;
  int _realase_year;
  double _cost;
  int _stock;
  List<dynamic> _actors;

  Film.fromJson(json){
    _id=json ["filmId"];
    _title=json["title"];
    _description=json["description"];
    _realase_year =json["releaseYear"] ;
    _cost=json["cost"];
    _stock=json["stock"];
    _actors=json["actors"];
  }
  Map json() =>{
    "filmId": _id,
    "title": _title,
    "description": _description,
    "releaseYear": _realase_year,
    "cost": _cost,
    "stock": _stock,
    "actors": _actors,
  };


  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get title => _title;

  int get stock => _stock;

  set stock(int value) {
    _stock = value;
  }

  double get cost => _cost;

  set cost(double value) {
    _cost = value;
  }


  int get realase_year => _realase_year;

  set realase_year(int value) {
    _realase_year = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  set title(String value) {
    _title = value;
  }

  List<dynamic> get actors => _actors;

  set actors(List<String> value) {
    _actors = value;
  }
}