import 'package:flutter/material.dart';
// Páginas
import 'package:Integrakin/paginas/productos.dart';

class CategoriasMenu extends StatelessWidget {
  final listadoCats;

  CategoriasMenu({Key key, this.listadoCats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      color: Colors.white,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: listadoCats == null ? 0 : listadoCats.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: InkWell(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(listadoCats[index]['imagen']),
                ),
                title: Text(listadoCats[index]['name']),
              ),
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Productos(listProductos: listadoCats[index]['slug'])
                    ),
                );
              },
            ),
          );
        }
      ),
    );
  }
}
