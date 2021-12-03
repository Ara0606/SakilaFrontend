import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pantallas_software/Cliente.dart';
import 'package:pantallas_software/Films.dart';

import 'url.dart' as api;
import 'package:shared_preferences/shared_preferences.dart';


class ApiData{
  String country="";
  getDatai() async {

  }

  Future<List<Film>>getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    country = prefs.getString('country');
    print(country+"desde api");
    getDatai();
    print("llega "+country);
    List<Film>tar=List();
    var url=api.url ;
    print("countryy desde get"+country);
    final response = await http.get(
        "http://192.168.0.2:8080/film/news/$country"
    );
    List mod= json.decode(utf8.decode(response.bodyBytes));
    mod.forEach((element) {
      Film t = new Film.fromJson(element);
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


  Future<List<Film>>getDataMostRental()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    country = prefs.getString('country');
    print(country+"desde api");
    getDatai();
    print("llega "+country);
    List<Film>tar=List();
    var url=api.url ;
    print("countryy desde get"+country);
    final response = await http.get(
        "http://192.168.0.2:8080/film/mostRental/$country"
    );
    List mod= json.decode(utf8.decode(response.bodyBytes));
    mod.forEach((element) {
      Film t = new Film.fromJson(element);
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

  Future<List<Film>>getDataUltimos()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    country = prefs.getString('country');
    print(country+"desde api");
    getDatai();
    print("llega "+country);
    List<Film>tar=List();
    var url=api.url ;
    print("countryy desde get"+country);
    final response = await http.get(
        "http://192.168.0.2:8080/film/$country"
    );
    List mod= json.decode(utf8.decode(response.bodyBytes));
    mod.forEach((element) {
      Film t = new Film.fromJson(element);
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
  Future<List<Film>>BusquedaActor(String name, String lastname)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    country = prefs.getString('country');
    print(country+"desde api");
    getDatai();
    print("llega "+country);
    List<Film>tar=List();
    var url=api.url ;
    print("countryy desde get"+country);
    final response = await http.get(
        "http://192.168.0.2:8080/actor/$country/$name/$lastname"
    );
    List mod= json.decode(utf8.decode(response.bodyBytes));
    mod.forEach((element) {
      Film t = new Film.fromJson(element);
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

  Future<List<Film>>BusquedaTitulo(String titulo)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    country = prefs.getString('country');
    print(country+"desde api");
    getDatai();
    print("llega "+country);
    List<Film>tar=List();
    var url=api.url ;
    print("countryy desde get"+country);
    final response = await http.get(
        "http://192.168.0.2:8080/film/$country/$titulo"
    );
    List mod= json.decode(utf8.decode(response.bodyBytes));
    mod.forEach((element) {
      Film t = new Film.fromJson(element);
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
  Future NuevoCliente (Cliente cli)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    country = prefs.getString('country');
    var countryid=int.parse(country);
    cli.country=countryid;
    final response = await http.post("http://192.168.0.2:8080/new_costumer/",
      body: jsonEncode(cli.json()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },);
    print(cli.json());
    if(response.statusCode==200){

      //tarea.id=jsonDecode(response.body)["task_id"];
      return cli;
    }
    else{
      return null;
    }
  }

  Future <int> Login(String correo)async{
  int id;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    country = prefs.getString('country');
    print(country+"desde api");
    getDatai();
    print("llega "+country);
    List<Cliente>tar=List();
    var url=api.url ;
    print("countryy desde get"+country);
    final response = await http.get(
        "http://192.168.0.2:8080/costumer/login/$correo"
    );
    print(response.body.toString());
    id=int.parse(response.body.toString());
    prefs.setString('id', id.toString());
    //id=response.body as int;

    if(response.statusCode==200){
      print("retorna id");
      print(id);
      return id;
    }
    else{
      return null;
    }

  }

}