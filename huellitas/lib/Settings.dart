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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSmallButton('Editar Perfil', Icons.account_circle, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UsuarioScreen(),
                ),
              );
            }),
            SizedBox(height: 20),
            _buildSmallButton('Politicas', Icons.assignment, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PoliticasScreen(),
                ),
              );
            }),
            SizedBox(height: 20),
            _buildSmallButton('Mascotas', Icons.pets, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MascotasScreen(),
                ),
              );
            }),
            SizedBox(height: 20),
            _buildIconButton('Cerrar Sesión', Icons.exit_to_app, () {
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

  Widget _buildSmallButton(
      String text, IconData iconData, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        primary: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Color(0xFF2DBDFE),
            size: 20.0,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF2DBDFE),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
      String text, IconData iconData, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
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
    );
  }
}
