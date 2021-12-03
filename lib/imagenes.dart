class Imagenes{
  //{
 // "id": "0",
  //"author": "Alejandro Escamilla",
  //"width": 5616,
  //"height": 3744,
  //"url": "https://unsplash.com/...",
 // "download_url": "https://picsum.photos/..."
  String _id;
  String _uthor;
  int _width;
  int _height;
  String _url;
  String _downald_url;


  Imagenes.fromJson(json){
    _id=json ["id"];
    _uthor=json["author"];
    _width=json["width"];
    _height =json["height"] ;
    _url=json["url"];
    _downald_url=json["download_url"];
  }
  Map json() =>{
    "id": _id,
    "author": _uthor,
    "width": _width,
    "height": _height,
    "url": _url,
    "dowload_url": _downald_url

  };

  String get downald_url => _downald_url;

  set downald_url(String value) {
    _downald_url = value;
  }

  String get url => _url;

  set url(String value) {
    _url = value;
  }


  int get width => _width;

  set width(int value) {
    _width = value;
  }

  String get uthor => _uthor;

  set uthor(String value) {
    _uthor = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  int get height => _height;

  set height(int value) {
    _height = value;
  }
}