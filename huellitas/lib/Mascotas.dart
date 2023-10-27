import 'package:flutter/material.dart';
import 'AgregarMascota.dart';
import 'DatosMascotas.dart';

class MascotasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Mascotas'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 100.0,
                    height: 100.0,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Caramelo',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Agregar aquí la funcionalidad para editar datos de la mascota.
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DatosMascotasScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      primary: Color(0xFF2DBDFE),
                    ),
                    child: Text(
                      'Editar Datos',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      bool confirmar = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Confirmar eliminación'),
                            content:
                                Text('¿Estás seguro de eliminar a la mascota?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text('Sí'),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirmar != null && confirmar) {
                        // Aquí eliminarías la mascota y mostrarías un mensaje de éxito.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Mascota eliminada con éxito'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      primary: Color(0xFF2DBDFE),
                    ),
                    child: Text(
                      'Eliminar Mascota',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la página para agregar mascota (AgregarMascota.dart)
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AgregarMascotaScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                primary: Color(0xFF2DBDFE),
              ),
              child: Text(
                'Agregar Mascota',
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
