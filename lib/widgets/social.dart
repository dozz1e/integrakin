import 'package:url_launcher/url_launcher.dart';

void llamarOpen() async {
  const url = 'tel:+56989503110';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No puede llamar';
  }
}

void whatsAppOpen() async {
  const url = 'https://api.whatsapp.com/send?phone=56989503110';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No funciona Whatsapp';
  }
}

void facebookOpen() async {
  const url = 'https://www.facebook.com/integrakinchile';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No funciona Facebook';
  }
}

void instagramOpen() async {
  const url = 'https://www.instagram.com/integrakin/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No funciona Instagram';
  }
}

void productoOpen(sku) async {
  var url = 'https://www.integrakin.cl/producto/$sku';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se ha podido conectar el Servidor';
  }
}

