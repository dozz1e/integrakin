import 'package:flutter/material.dart';
import 'dart:convert';
// Páginas
import 'package:Integrakin/vistas/listadoProductos.dart';

class Productos extends StatelessWidget {
  final listProductos;

  Productos({Key key, this.listProductos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle
        .of(context)
        .loadString('assets/json/$listProductos.json'),
      builder: (context, snapshot) {
        var new_data = json.decode(snapshot.data.toString());
        return new_data != null
          ? ListadoProductos(listadoProds: new_data)
          : Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover
            )
          ),
          child: Center(
            child: CircularProgressIndicator()
          )
        );
      }
    );
  }
}

