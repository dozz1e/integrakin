import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String>{
  final productos = [
    "Valparaíso",
    "Santiago",
    "Viña del Mar",
    "Concepción",
    "La Serena",
    "Coquimbo",
    "Arica",
    "Iquique"
  ];

  final productosRecientes = [
    "Santiago",
    "Valparaíso",
    "Viña del Mar"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
      icon: Icon(Icons.clear),
      onPressed: (){
        query = "";
      },
    )];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? productosRecientes : productos.where((p)=>p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){

        },
        leading: Icon(Icons.business_center),
        title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          children: [
            TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(
                color: Colors.grey
              )
            )
          ]
        )),
      ),
      itemCount: suggestionList.length,
    );
  }

}