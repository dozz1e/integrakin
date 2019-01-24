import 'package:flutter/material.dart';
// Páginas
import 'package:Integrakin/paginas/productos.dart';

class ListadoCategorias extends StatelessWidget {
  final listadoCats;

  ListadoCategorias({Key key, this.listadoCats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = ScrollController();
    return Container(
      height: 175.0,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 170.0,
            width: 120.0,
            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: InkWell(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 110.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          listadoCats[index]['imagen'])
                      )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      listadoCats[index]['name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Productos(listProductos: listadoCats[index]['slug'])
                  )
                );
              }
            ),
          );
        },
        itemCount: listadoCats == null ? 0 : listadoCats.length,
      ),
    );
  }
}
