class Cliente{
  String _nombre;
  String _apellido;
  String _email;
  String _adress;
  String _adress2;
  String _distrito;
  int _id;
  int _country;
  Cliente.fromJson(json){
    _country=json ["country"];
    _adress=json["adress"];
    _adress2=json["adress2"];
    _distrito =json["distrito"] ;
    _nombre=json["nombre"];
    _apellido=json["apellido"];
    _email=json["email"];
  }


  Cliente(this._nombre, this._apellido, this._email, this._adress,
      this._adress2, this._distrito);

  Map json() =>{
    "country": _country,
    "adress": _adress,
    "adress2": _adress2,
    "distrito": _distrito,
    "nombre": _nombre,
    "apellido": _apellido,
    "email": _email,
  };

  int get country => _country;

  // ignore: unnecessary_getters_setters
  set country(int value) {
    _country = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get distrito => _distrito;

  set distrito(String value) {
    _distrito = value;
  }

  String get adress2 => _adress2;

  set adress2(String value) {
    _adress2 = value;
  }

  String get adress => _adress;

  set adress(String value) {
    _adress = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get apellido => _apellido;

  set apellido(String value) {
    _apellido = value;
  }

  String get nombre => _nombre;

  set nombre(String value) {
    _nombre = value;
  }
}