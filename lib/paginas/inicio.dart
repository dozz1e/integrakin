import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'dart:convert';

// Páginas
import 'package:Integrakin/paginas/categorias.dart';
import 'package:Integrakin/paginas/grid.dart';
import 'package:Integrakin/paginas/productos.dart';
import 'package:Integrakin/paginas/menuAside.dart';
// Widgets
import 'package:Integrakin/widgets/social.dart';
import 'package:Integrakin/widgets/buscar.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Image.asset('assets/images/titulo.png', height: 25.0,),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.indigo
          ),
          /*actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DataSearch()
                );
              }
            )
          ]*/
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100.0,
                color: Colors.indigoAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset('assets/images/icon.png', height: 80.0,),
                      title: Text('INTEGRAKIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      subtitle: Text('www.integrakin.cl', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0, top: 10.0),
                  child: Text('Categorías',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  ),
                ),
              ),
              MenuAside(),
              Divider(),
              Container(
                height: 250.0,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    InkWell(
                      child: ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Llamar 989503110'),
                        onTap: (){
                          llamarOpen();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    InkWell(
                      child: ListTile(
                        leading: Image.asset('assets/images/facebook.png', height: 40.0,),
                        title: Text('Facebook'),
                        onTap: (){
                          facebookOpen();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    InkWell(
                      child: ListTile(
                        leading: Image.asset('assets/images/whatsapp.png' ,height: 40.0,),
                        title: Text('WhatsApp'),
                        onTap: (){
                          whatsAppOpen();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    InkWell(
                      child: ListTile(
                        leading: Image.asset('assets/images/instagram.png', height: 40.0,),
                        title: Text('Instagram'),
                        onTap: (){
                          instagramOpen();
                        },
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 300.0,
              child: Carousel(
                images: [
                  AssetImage("assets/images/portada1.jpg"),
                  AssetImage("assets/images/portada2.jpg"),
                  AssetImage("assets/images/portada3.jpg"),
                  AssetImage("assets/images/portada4.jpg"),
                  AssetImage("assets/images/portada5.jpg"),
                ],
                dotSize: 6.0,
                dotSpacing: 10.0,
                indicatorBgPadding: 6.0,
                dotBgColor: Colors.grey[800].withOpacity(0.3),
              ),
            ),
            Categorias('Todos'),
            ListTile(
              leading: Text('Productos Oferta', style: TextStyle(fontSize: 14.0),),
              trailing: InkWell(
                child: Text(
                  'Ver Todas',
                  style: TextStyle(
                    fontSize: 14.0
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Productos(listProductos: 'ofertas')
                    )
                  );
                },
              ),
            ),
            ListadoProductosGrid(),
            Card(
              color: Colors.indigo,
              child: ListTile(
                leading: Text('INTEGRAKIN',style: TextStyle(color: Colors.white, fontSize: 18.0),),
                trailing: Text('2019',style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
