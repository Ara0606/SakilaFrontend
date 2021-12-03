import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'imagenes.dart';



class DataImagenes{
  Future<List<Imagenes>>getData()async{
    List<Imagenes>tar=List();

    final response = await http.get(
        'https://picsum.photos/v2/list?page=2&limit=15'
    );
    List mod= json.decode(utf8.decode(response.bodyBytes));
    mod.forEach((element) {
      Imagenes t = new Imagenes.fromJson(element);
      print (t.url);
      tar.add(t);
      print("ciclo");
      print(tar);
    });
    print(mod);
    if(response.statusCode==200){
      return tar;
    }
    else{
      return null;
    }
  }
}