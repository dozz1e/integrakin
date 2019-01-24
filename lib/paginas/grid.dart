import 'package:flutter/material.dart';
import 'dart:convert';
// Vistas
import 'package:Integrakin/vistas/listadoGrid.dart';

class ListadoProductosGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 2,
      child: FutureBuilder(
        future: DefaultAssetBundle
          .of(context)
          .loadString('assets/json/ofertas.json'),
        builder: (context, snapshot) {
          var new_data = json.decode(snapshot.data.toString());
          return new_data != null
              ? ListadoGrid(listadoProd: new_data)
              : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover
              )
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      ),
    );
  }
}
