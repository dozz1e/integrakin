import 'package:flutter/material.dart';
import 'package:flutter_html_textview/flutter_html_textview.dart';
// Widget
import 'package:Integrakin/widgets/social.dart';

// Futuro
//import 'package:integrakin/futuros/carritoFuture.dart';
// Widgets
import 'package:Integrakin/widgets/precio.dart';
// Páginas
//import 'package:integrakin/paginas/carrito.dart';

class DetalleScreen extends StatelessWidget{
  final producto;

  DetalleScreen({Key key, this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Producto', style: TextStyle(fontWeight: FontWeight.bold),),
        /*actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              /*Navigator.push(context,
                MaterialPageRoute(builder: (context) => Carrito()
                )
              );*/
            },
          ),
        ],*/
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(producto['images'][0]['src'],fit: BoxFit.contain,),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(11.0),
              child: Text(
                producto['name'].toUpperCase(),
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 11.0, right: 11.0),
              child: Text(
                'Código Producto: ${producto["sku"]}',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            precio( producto['price'], producto['regular_price']),
            Padding(
              padding: const EdgeInsets.only(left: 11.0, bottom: 6.0),
              child: Text('Envíos solo para Chile', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),
              ),
            ),
            Container(
              child: HtmlTextView(
                data: producto['description'],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60.0,
        child: RaisedButton(
          onPressed: () {
            productoOpen(producto['sku']);
          },
          child: Text(
            'COMPRAR PRODUCTO',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}