import 'package:flutter/material.dart';
import 'dart:convert';
// Vistas
import 'package:Integrakin/vistas/listadoCategorias.dart';

class Categorias extends StatelessWidget {
  final String filtro;

  Categorias(this.filtro);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle
        .of(context)
        .loadString('assets/json/menu_todos.json'),
      builder: (context, snapshot) {
        var new_data = json.decode(snapshot.data.toString());
        return ListadoCategorias(listadoCats: new_data);
      }
    );
  }
}
