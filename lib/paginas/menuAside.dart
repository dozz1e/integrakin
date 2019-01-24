import 'package:flutter/material.dart';
import 'dart:convert';
// Vistas
import 'package:Integrakin/vistas/categoriasMenu.dart';

class MenuAside extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle
            .of(context)
            .loadString('assets/json/menu_todos.json'),
        builder: (context, snapshot) {
          var new_data = json.decode(snapshot.data.toString());
          return CategoriasMenu(listadoCats: new_data);
        }
    );
  }
}
