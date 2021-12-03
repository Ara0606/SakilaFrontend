import 'package:flutter/material.dart';
import 'package:pantallas_software/Carrito.dart';
import 'package:provider/provider.dart';
class CarritoVista extends StatefulWidget {
  @override
  _CarritoVistaState createState() => _CarritoVistaState();
}

class _CarritoVistaState extends State<CarritoVista> {
  double costo;
  @override
  Widget build(BuildContext context) {
    final _carrito = Provider.of<Carrito>(context);
    var colormorado = const Color(0xffC06FF7);
    var colorazul = const Color(0xff6b5fd4);
    var colorceleste = const Color(0xff75a2eb);
    var colorverde = const Color(0xff5fc4d4);
    return Scaffold(
      backgroundColor: Color(0xFFE3EEFF),
      appBar: AppBar(
        backgroundColor: colorceleste,
        title: Text("Carrito"),
      ),
      body:  Column(
          children: <Widget>[
          Container(
               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
              height: MediaQuery.of(context).size.height*0.7,
                width: MediaQuery.of(context).size.width ,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _carrito.carrito.length,
              itemBuilder: (BuildContext context, int index) {
              return Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  SizedBox(
                     width: 300,
                    child: ListTile(
                      title: Text( '${_carrito.carrito[index].title}'.toUpperCase(),style: TextStyle(fontSize: 15, color: Colors.blue),),
                  // subtitle: Image.network(_vlam[index].downald_url,width: 50,height: 50,),
                ),
              ),
                Text('${_carrito.carrito[index].description}'.toUpperCase()),
                Row(

                children: [
                  Text('${_carrito.carrito[index].cost}'.toUpperCase(),style: TextStyle(fontSize: 20,color: colormorado),),
                  Icon(Icons.attach_money,color: colormorado,)
                ],
              ),
                Row(
                children: [
                  Text("Stock:",style: TextStyle(fontSize: 18)),
                  Text('${_carrito.carrito[index].stock}'.toUpperCase(),style: TextStyle(fontSize: 14),),
                ],
              ),

                FlatButton(
                onPressed: ()  async {
                  _carrito.removeFromCatalog(_carrito.carrito[index]);
                  setState(() {

                  });

                },
                  child: Icon(Icons.remove_shopping_cart_outlined,size: 30,),
              )
            ],
          );
        },
      ),
    ),
  ]

      ));
  }
}
