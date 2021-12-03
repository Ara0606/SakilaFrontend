
import 'package:flutter/material.dart';
import 'package:pantallas_software/ApiData.dart';
import 'package:pantallas_software/Cliente.dart';

import 'LoginDemo.dart';



class Registro extends StatefulWidget {
  @override
  _Registro createState() => _Registro();
}

class _Registro extends State<Registro> {
  TextEditingController nomnbre= TextEditingController();
  TextEditingController napellido= TextEditingController();
  TextEditingController nemail= TextEditingController();
  TextEditingController ndireccion= TextEditingController();
  TextEditingController ndireccion2= TextEditingController();
  TextEditingController ndistrito= TextEditingController();
  var colormorado = const Color(0xffC06FF7);
  var colorazul = const Color(0xff6b5fd4);
  var colorceleste = const Color(0xff75a2eb);
  var colorverde = const Color(0xff5fc4d4);
  ApiData dt;
  @override
  void initState() {

    dt = new ApiData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3EEFF),
      appBar: AppBar(
        backgroundColor: colorceleste,
        title: Text("Registro de usuarios"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 400,
                    height: 300,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/imagen1.jpg',
                      width: 300,
                      height: 300,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:15,bottom: 0),
             // padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nomnbre,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    hintText: 'Ingrese su nombre de usuario'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: napellido,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Apellido',
                    hintText: 'Ingrese su apellido'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:15,bottom: 0),
             // padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nemail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Ingrese su email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:15,bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: ndireccion,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Direccion',
                    hintText: 'Direccion'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:15,bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: ndireccion2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Direccion 2',
                    hintText: 'Direccion 2'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:15,bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: ndistrito,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Distrito',
                    hintText: 'Distrito'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.purple, borderRadius: BorderRadius.circular(20)),
              child: FlatButton (
                onPressed: () async{
                  Cliente cli=new Cliente(nomnbre.text,napellido.text,nemail.text,ndireccion.text,ndireccion2.text,ndistrito.text);
                  await dt.NuevoCliente(cli);
                    print(nomnbre.text);
                  print(nemail.text);
                  setState(() {
                    print(nomnbre.text);
                    print(nemail.text);
                   // _vlam.add(d);

                  }
                  );
                },
                child: Text(
                  'REGISTRARSE',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.purple, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginDemo())
                  );
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}