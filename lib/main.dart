import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantallas_software/Carrito.dart';
import 'package:pantallas_software/paginaInicio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';


void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Carrito()),

    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFE3EEFF)),

        home:MyApp()
    ),
  ),
);

class MyApp extends StatelessWidget {
  var colormorado = const Color(0xffC06FF7);
  var colorazul = const Color(0xff6b5fd4);
  var colorceleste = const Color(0xff75a2eb);
  var colorverde = const Color(0xff5fc4d4);
  String country = "country";
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Color(0xFFE3EEFF),
        appBar: AppBar(
          title: Text('Pagina de inicio'),
        ),
        body: new Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                  child: Image.asset("assets/logo.png",width: 300,height: 300),
              ),
              // Stroked text as border.
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.normal,
                        color: Colors.red
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Icon(Icons.flag, color: Colors.blue[400],size: 100,),
                    disabledColor: Colors.amber,
                    splashColor: Colors.amber,
                    color: Colors.cyan[100],
                      onPressed: () async {
                      country='1';
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('country', country);
                        // Navega a la segunda pantalla usando una ruta con nombre
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Inicio()));
                      }
                  ),

                  RaisedButton(
                    child: Icon(Icons.flag, color: Colors.purple[400],size: 100,),
                    disabledColor: Colors.amber,
                    splashColor: Colors.amber,
                    color: colorverde,
                      onPressed: () async {
                      country="2";
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('country', country);
                        // Navega a la segunda pantalla usando una ruta con nombre
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Inicio()));
                      }
                  ),

                  // Solid text as fill.

                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Canada",style: TextStyle(fontSize: 20),),
                SizedBox(width: 75),
                Text("Australia",style: TextStyle(fontSize: 20),)
              ],
            )

            ],
          ),
        ),
      );

  }
  Future<void> saveMyName(String country) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('country', country);
  }

  Future<void> getMyName() async {
    final prefs = await SharedPreferences.getInstance();
    country = prefs.getString('country') ?? "Name not found";

  }

  Future<void> removeMyName() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
  }
}
