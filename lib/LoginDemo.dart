

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pantallas_software/ApiData.dart';
import 'package:pantallas_software/Registro.dart';
import 'package:pantallas_software/main.dart';
import 'package:pantallas_software/paginaInicio.dart';


//List<Usuario> _vlam;
//bool completado=false;
//Data dt;
class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  TextEditingController user= TextEditingController();
  TextEditingController pass= TextEditingController();
  ApiData dt;
  //List<Usuario> _vlam;
  @override
  void initState() {

    dt = new ApiData();
    super.initState();
  }  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3EEFF),
      appBar: AppBar(
        backgroundColor: Color(0xff75a2eb),
        title: Text("Ingreso al sistema"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 400,
                    height: 250,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/banner.png',
                      width: 300,
                      height: 300,)),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: user,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuario',
                    hintText: 'Ingrese su nombre de usuario'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Ingrese su contraseña'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color(0xff6b5fd4), borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: ()  async {

                  int k=await dt.Login(user.text);
                  print (k);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Inicio()));
                },
                child: Text(
                  'Ingresar',
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
                  color: Color(0xffC06FF7), borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {

                  setState(() {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Registro()));
                  });
                },
                child: Text(
                  'Registrarse',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _showMessageDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("ERROR"),
      content: Text("Usuario o password incorrectos"),
      actions: <Widget>[
        FlatButton(
          child: Text("Yes"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
