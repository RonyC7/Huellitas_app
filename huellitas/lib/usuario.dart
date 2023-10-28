import 'package:flutter/material.dart';
import 'chats.dart';
import 'Settings.dart';
import 'Pdatos.dart';
import 'EditarUsuario.dart'; // Importa la pantalla EditarUsuario.dart

class UsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2DBDFE), // Color azul
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/HuellaBlanca.png',
              width: 40.0,
              height: 40.0,
            ),
            Text(
              'Perfil de Usuario',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Acción al presionar el ícono de usuario (en este caso, no hacemos nada)
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra todo en vertical
          children: [
            CircleAvatar(
              radius: 80,
              // Agrega aquí la imagen del usuario
              backgroundImage: AssetImage('assets/images/Prueba1.png'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Usuario: RonyC7',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Nombre: Rony',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Apellido: Carpio',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Correo: ronycarpio@gmail.com',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Teléfono: 42775879',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Dirección: Zona 7',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Redirige a la página EditarUsuario.dart cuando se presiona el botón "Editar Datos"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditarUsuarioScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2DBDFE), // Color azul
              ),
              child: Text(
                'Editar Datos',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF2DBDFE), // Color azul
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                // Navegar a la página de chats
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatsScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navegar a la pantalla de inicio (PdatosScreen)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PdatosScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Navegar a la página de configuración
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
