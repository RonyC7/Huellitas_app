import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:huellitas/Bcuidador.dart';
import 'package:huellitas/EditarUsuario.dart';
import 'dart:convert';

import 'package:huellitas/Settings.dart';
import 'package:huellitas/chats.dart';

class UsuarioScreen extends StatefulWidget {
  final String username;

  UsuarioScreen({Key? key, required this.username}) : super(key: key);

  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _fetchUsuarioData();
  }

  Future<void> _fetchUsuarioData() async {
    final url =
        Uri.parse('http://localhost:8000/api/propietario/${widget.username}/');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          userData = json.decode(response.body)['propietario'];
        });
      } else {
        print('Error en la solicitud: ${response.body}');
      }
    } catch (e) {
      print('Error al obtener datos del usuario: $e');
    }
  }

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
        child: userData == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: userData!['imagen'] != null
                        ? NetworkImage(userData!['imagen'])
                        : AssetImage('assets/images/Prueba1.png')
                            as ImageProvider,
                  ),
                  SizedBox(height: 20.0),
                  Text('Nombre: ${userData!['nombre'] ?? 'N/A'}',
                      style: TextStyle(fontSize: 20.0)),
                  Text('Apellido: ${userData!['apellido'] ?? 'N/A'}',
                      style: TextStyle(fontSize: 20.0)),
                  Text('Dirección: ${userData!['direccion'] ?? 'N/A'}',
                      style: TextStyle(fontSize: 20.0)),
                  Text('Teléfono: ${userData!['telefono'] ?? 'N/A'}',
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Redirige a la página EditarUsuario.dart cuando se presiona el botón "Editar Datos"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditarUsuarioScreen(username: widget.username)),
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
                  MaterialPageRoute(builder: (context) => Bcuidador()),
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
