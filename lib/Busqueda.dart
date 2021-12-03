import 'package:flutter/material.dart';
import 'package:pantallas_software/ApiData.dart';

import 'Carrito.dart';
import 'Films.dart';
import 'package:provider/provider.dart';
class Busqueda extends StatefulWidget {
  @override
  _BusquedaState createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  ApiData dt;
  List<Film> _actors;

  TextEditingController actor = TextEditingController();

  @override
  void initState() {
    _actors = [];
    dt = new ApiData();
    super.initState();
    //Pendientes("", "");
  }

  void Pendientes(String name, String lastname) async {
    var te = await dt.BusquedaActor(name, lastname);
    setState(() {
      _actors = te;
    });
  }
  void comprobar(){
    if(_actors==null){
      print ("entra");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _carrito = Provider.of<Carrito>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("Busqueda por actor"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              // padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: actor,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    hintText: 'Ingrese su nombre de actor'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () async {
                      var name = actor.text.split(' ');
                      print(name[0] + "  f " + name[1]);
                      var nombre = name[0];
                      var apellido = name[1];
                      var te = await dt.BusquedaActor(nombre, apellido);
                      setState(() {
                          _actors = te;
                          print("///////");
                          print(_actors.toString());
                      });


                  },
                  child: Text(
                    'Buscar',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ListView.builder(

                scrollDirection: Axis.vertical,
                itemCount: _actors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 1200,
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(_actors[index].title, style: TextStyle(
                                  fontSize: 15, color: Colors.blue),),
                            ],
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(_actors[index].actors.toString()),
                            ],
                          ),
                        ),
                      ),
                      Text(_actors[index].cost.toString()),
                      Text(_actors[index].stock.toString()),
                      FlatButton(
                        onPressed: () async {
                          print(_actors[index].title);
                          _carrito.addToCatalog(_actors[index]);
                        },
                        child: Icon(Icons.add_shopping_cart),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}
