import 'package:flutter/material.dart';
import 'main.dart';
import 'usuario.dart';
import 'politicas.dart';
import 'Mascotas.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2DBDFE),
        title: Text(
          'Configuración',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton('Editar Perfil', Icons.account_circle, () {}),
            SizedBox(height: 20),
            _buildButton('Politicas', Icons.assignment, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PoliticasScreen(),
                ),
              );
            }),
            SizedBox(height: 20),
            _buildButton('Mascotas', Icons.pets, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MascotasScreen(),
                ),
              );
            }),
            SizedBox(height: 20),
            _buildButton('Cerrar Sesión', Icons.exit_to_app, () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, IconData iconData, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity, // Ocupar todo el ancho disponible
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 15.0,
          ),
          primary: Colors.white,
        ),
        icon: Icon(
          iconData,
          color: Color(0xFF2DBDFE),
          size: 20.0,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: Color(0xFF2DBDFE),
          ),
        ),
      ),
    );
  }
}
