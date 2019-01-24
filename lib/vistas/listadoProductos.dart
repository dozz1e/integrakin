import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// Páginas
import 'package:Integrakin/paginas/producto.dart';

class ListadoProductos extends StatelessWidget {
  final listadoProds;

  ListadoProductos({Key key, this.listadoProds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Listado Productos', style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold),),
        ),
        body: ListView.builder(
          itemCount: listadoProds == null ? 0 : listadoProds.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: ListTile(
                leading: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(listadoProds[index]['images'][0]['src'])
                        )
                    )
                ),
                title: Text(
                  listadoProds[index]['name'],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: Text(
                  listadoProds[index]['sku'],
                  style: TextStyle(
                      fontSize: 14.0
                  ),
                ),
                trailing: Text(
                  'Ver Más',
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 16.0
                  ),
                ),
                onTap: (){
                  var route = MaterialPageRoute(
                      builder: (BuildContext context) =>
                          DetalleScreen(producto: listadoProds[index])
                  );
                  Navigator.of(context).push(route);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

