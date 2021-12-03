import 'package:flutter/material.dart';
import 'package:pantallas_software/Films.dart';

class Carrito with ChangeNotifier {
  List<Film> _carrito=[];

  List<Film> get carrito => _carrito;

  set carrito(List<Film> value) {
    _carrito = value;
  }
  void addToCatalog(Film film) {
    _carrito.add(film);
    notifyListeners();
  }
  double  total(Film film){
    var total = 0.0;
    total += film.cost ;
    return total;
  }

  void removeFromCatalog(Film film) {
    _carrito.remove(film);
    notifyListeners();
  }


}