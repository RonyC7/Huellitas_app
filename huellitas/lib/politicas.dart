import 'package:flutter/material.dart';

class PoliticasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Políticas de Privacidad'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Políticas de Privacidad de Huellitas',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Última actualización: [Fecha de última actualización]',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Bienvenido a Huellitas, una aplicación diseñada para el cuidado de mascotas.',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'En Huellitas, respetamos y valoramos tu privacidad. Esta política de privacidad tiene como objetivo proporcionarte información sobre cómo recopilamos, utilizamos y protegemos tus datos personales. Al utilizar nuestra aplicación, aceptas las prácticas descritas en este documento.',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Gracias por utilizar nuestra app.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // Agrega aquí el resto del texto de tus políticas de privacidad.

                  // Puedes agregar más párrafos y secciones según sea necesario.
                ],
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/images/Politicas.png',
              width: 500,
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}
