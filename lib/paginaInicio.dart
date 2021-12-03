import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pantallas_software/ApiData.dart';
import 'package:pantallas_software/Busqueda.dart';
import 'package:pantallas_software/BusquedaTitulo.dart';
import 'package:pantallas_software/Carrito.dart';
import 'package:pantallas_software/CarritoVista.dart';
import 'package:pantallas_software/Films.dart';
import 'package:pantallas_software/LoginDemo.dart';
import 'package:pantallas_software/imagenes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'dataImages.dart';
import 'main.dart';
class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  var colormorado = const Color(0xffC06FF7);
  var colorazul = const Color(0xff6b5fd4);
  var colorceleste = const Color(0xff75a2eb);
  var colorverde = const Color(0xff5fc4d4);
  String country="";
  ApiData a;
  DataImagenes dt;
  List<Imagenes> _vlam;
  List<Film> _film;
  List<Film> _filmMost;
  List<Film> _filmLast;
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      country = prefs.getString('country');

      print(country);
    });
  }
  @override
  void initState() {
    getData();
    _vlam = [];
    _film = [];
    _filmMost=[];
    _filmLast=[];
    a=new ApiData();
    dt = new DataImagenes();
    Pendientes();
    super.initState();
  }
  @override
  void Pendientes() async{
    getData();
    var o=await a.getDataUltimos();
    var n=await a.getDataMostRental();
    print("Country desde pendientes"+country);
    var f=await a.getData();
    print(a.country);
    var te=await dt.getData();
    setState(() {
      _filmLast=o;
      _filmMost=n;
      _film=f;
      _vlam = te;
    });
  }
  @override
  Widget build(BuildContext context) {
    final _carrito = Provider.of<Carrito>(context);
    return Scaffold(
        backgroundColor: Color(0xFFE3EEFF),
        appBar: AppBar(
        backgroundColor: colorceleste,
        title: Text("Alquila tu pelicula favorita $country"),
    ),
        body:  Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width ,
                child: ListView.builder(

                    scrollDirection: Axis.horizontal,
                    itemCount: _vlam.length,
                    itemBuilder: (BuildContext context, int index) {
                     return Column(
                       children:<Widget> [
                         SizedBox(
                            width: 100,
                            child: ListTile(
                                  title: Text(_film[index].title,style: TextStyle(fontSize: 15, color: Colors.blue),),
                                 // subtitle: Image.network(_vlam[index].downald_url,width: 50,height: 50,),
                                ),
                          ),
                         Text(_film[index].cost.toString()),
                         Text(_film[index].stock.toString()),
                         FlatButton(
                           onPressed: ()  async {
                             _carrito.addToCatalog(_film[index]);
                             print(_film[index].title);
                             print(_carrito.carrito);
                             print(_carrito.toString());
                             print(_carrito.carrito.toString());
                           },
                           child: Icon(Icons.add_shopping_cart),
                         )
                       ],
                     );
                    },
                  ),
              ),
            Text("Las mas rentadas la ultima semana"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 5.0),
              height: MediaQuery.of(context).size.height * 0.23,
              width: MediaQuery.of(context).size.width ,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _vlam.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children:<Widget> [
                      SizedBox(
                        width: 120,
                        child: ListTile(

                          title: Text(_filmMost[index].title,style: TextStyle(fontSize: 13, color: Colors.blue)),
                         // subtitle: Image.network(_vlam[index].downald_url,width: 50,height: 50,),
                        ),
                      ),
                      Text(_filmMost[index].cost.toString()),
                      Text(_filmMost[index].stock.toString()),
                      FlatButton(
                        onPressed: ()  async {
                          _carrito.addToCatalog(_filmMost[index]);
                          print(_filmMost[index].title);
                        },
                        child: Icon(Icons.add_shopping_cart),
                      )
                    ],
                  );
                },
              ),
            ),

            Text("Las mas rentadas los ultimos tiempos"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width ,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _vlam.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children:<Widget> [
                      SizedBox(
                        width: 130,

                        child: ListTile(
                          title: Text(_filmLast[index].title,style: TextStyle(fontSize: 12, color: Colors.blue)),
                          //subtitle: Image.network(_vlam[index].downald_url,width: 30,height: 30,),
                        ),
                      ),
                      Text(_filmLast[index].cost.toString()),
                      Text(_filmLast[index].stock.toString()),
                      FlatButton(
                        onPressed: ()  async {
                          _carrito.addToCatalog(_filmLast[index]);
                          print(_filmLast[index].title);
                        },
                        child: Icon(Icons.add_shopping_cart,color: Colors.purple,),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),

    bottomNavigationBar: BottomNavigationBar(
    onTap: (int index){
      setState(() {
        print(getData());
        print(country);
        if(index==0){
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Busqueda()));
        }
        else if(index==1){
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => BusquedaTitulo()));
        }
        else if(index==2){
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CarritoVista()));
        }
        else if(index==3){
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginDemo()));
        }
      });
    },
    iconSize: 40,// tamaño de ícono
    type: BottomNavigationBarType.fixed,// configurar las pestañas inferiores para tener múltiples, no se cerrará
    items: [
    BottomNavigationBarItem(
    icon: Icon(Icons.search),

    title: Text(' Actor' ),
    ), BottomNavigationBarItem(
        icon: Icon(Icons.search),
        title: Text(' Titulo' ),

      ),
     BottomNavigationBarItem(
    icon: Icon(Icons.add_shopping_cart,size: 40,),
    title: Text('Carrito')
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.account_box_outlined),
    title: Text('Sign in')

    ),

    ],
    ),

        );

  }
}


