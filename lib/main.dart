import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// Páginas
import 'package:Integrakin/paginas/inicio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final appTitulo = 'Integrakin Expertos en Aparatología y Electro Estática';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitulo,
      home: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: 400.0,
                color: Colors.indigo,
              ),
            ),
            SplashScreen(
              seconds: 5,
              navigateAfterSeconds: Inicio(),
              backgroundColor: Colors.transparent,
              title: Text('Expertos en Aparatología y Electro Estética',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              image: Image.asset('assets/images/logo.png'),
              styleTextUnderTheLoader: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              photoSize: 80.0,
              loaderColor: Colors.indigo
            ),
          ],
        ),
      ),
    );
  }
}