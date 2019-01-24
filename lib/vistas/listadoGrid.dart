import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
// Páginas
import 'package:Integrakin/paginas/producto.dart';


class ListadoGrid extends StatelessWidget {
  final listadoProd;

  ListadoGrid({Key key, this.listadoProd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = ScrollController();
    return StaggeredGridView.countBuilder(
      physics: NeverScrollableScrollPhysics(),
      controller: _controller,
      crossAxisCount: 4,
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0)
                  ),
                  child: CachedNetworkImage(
                    imageUrl: listadoProd[index]['images'][0]['src'],
                    errorWidget: Icon(Icons.error),
                  ),
                )
                ,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0)
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                      bottom: 12.0, left: 12.0, right: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          listadoProd[index]['name'],
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Código: ${listadoProd[index]['sku']}',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
              var route = MaterialPageRoute(
                builder: (BuildContext context) =>
                  DetalleScreen(producto: listadoProd[index])
              );
              Navigator.of(context).push(route);
            }
          )
        );
      },
      staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
    );
  }
}
