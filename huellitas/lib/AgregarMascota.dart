import 'package:flutter/material.dart';
import 'Mascotas.dart';

class AgregarMascotaScreen extends StatefulWidget {
  @override
  _AgregarMascotaScreenState createState() => _AgregarMascotaScreenState();
}

class _AgregarMascotaScreenState extends State<AgregarMascotaScreen> {
  String nombre = '';
  String raza = '';
  int edad = 0;
  String imagenURL = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Mascota'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(75),
                image: imagenURL.isEmpty
                    ? null
                    : DecorationImage(
                        image: NetworkImage(imagenURL),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Agregar aquí la funcionalidad para subir una imagen.
                // Esto podría incluir mostrar un diálogo para seleccionar o tomar una foto.
                // Después de seleccionar la imagen, actualiza la variable 'imagenURL'.
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Subir Imagen'),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  nombre = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Nombre de la mascota',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  raza = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Raza de la mascota',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  edad = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                hintText: 'Edad de la mascota',
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Agregar aquí la funcionalidad para guardar la mascota.
                    // Debes crear una instancia de 'Mascota' con los datos ingresados.
                    // Luego, puedes agregar esta mascota a una lista o base de datos.
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MascotasScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('Guardar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Cancelar y regresar a la pantalla de mascotas.
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
