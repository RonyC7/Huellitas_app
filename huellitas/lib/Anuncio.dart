import 'package:flutter/material.dart';
import 'Pdatos.dart';

class AnuncioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Publicar Anuncio'),
        ),
        automaticallyImplyLeading: false, // Deshabilita la flecha de retroceso
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre mascota',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Descripción del cuidado',
              ),
              maxLines: 3, // Permite varias líneas para la descripción
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Ubicacion',
              ),
            ),
            SizedBox(height: 20.0),
            // Agregar aquí el widget para subir una foto
            // Puedes usar un ElevatedButton para la carga de fotos
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de cargar foto
              },
              child: Text('Cargar Foto'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "Publicar Anuncio"
                // Aquí puedes agregar la lógica para publicar el anuncio
                // Puedes mostrar un mensaje de éxito y redirigir a la pantalla Pdatos
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tu publicación se ha realizado con éxito'),
                  ),
                );

                // Regresar a la pantalla Pdatos
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                primary: Colors.blue,
              ),
              child: Text(
                'Publicar Anuncio',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "Regresar"
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                primary: Colors.red, // Cambia el color del botón a rojo
              ),
              child: Text(
                'Regresar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
