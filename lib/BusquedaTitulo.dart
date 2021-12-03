import 'package:flutter/material.dart';
import 'package:pantallas_software/ApiData.dart';
import 'package:provider/provider.dart';

import 'Carrito.dart';
import 'Films.dart';
class BusquedaTitulo extends StatefulWidget {
  @override
  _BusquedaState createState() => _BusquedaState();
}

class _BusquedaState extends State<BusquedaTitulo> {
  ApiData dt;
  List<Film> _actors;
  var colormorado = const Color(0xffC06FF7);
  var colorazul = const Color(0xff6b5fd4);
  var colorceleste = const Color(0xff75a2eb);
  var colorverde = const Color(0xff5fc4d4);

  TextEditingController actor = TextEditingController();

  @override
  void initState() {
    _actors = [];
    dt = new ApiData();
    super.initState();
    //Pendientes("", "");
  }



  @override
  Widget build(BuildContext context) {
    final _carrito = Provider.of<Carrito>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colorceleste,
        title: Text("Busqueda por Titulo"),
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
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: colorverde,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () async {
                    var te = await dt.BusquedaTitulo(actor.text);
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
                              Text(_actors[index].description.toString()),
                            ],
                          ),
                        ),
                      ),
                      Text(_actors[index].cost.toString()),
                      FlatButton(
                        onPressed: () async {
                          _carrito.addToCatalog(_actors[index]);
                          print(_actors[index].title);
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
