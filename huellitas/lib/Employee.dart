import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:huellitas/main.dart';

class EmployeeScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  EmployeeScreen({Key? key, required this.userData}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Puedes añadir la lógica para manejar la navegación aquí
    });
  }

  Future<void> _logout(BuildContext context) async {
    // Realiza una solicitud HTTP para cerrar la sesión en el backend
    final response = await http.post(
      Uri.parse(
          'http://localhost:8000/api/logout/'), // Reemplaza con la URL correcta
    );

    if (response.statusCode == 200) {
      // La sesión se cerró exitosamente, redirige a la pantalla principal
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MyApp(), // Reemplaza con el nombre correcto de tu aplicación
        ),
      );
    } else {
      // Maneja el error, por ejemplo, mostrando un mensaje al usuario
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('No se pudo cerrar la sesión. Inténtalo de nuevo.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String username = widget.userData['username'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        automaticallyImplyLeading: false, // Quita la flecha de retroceso
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Coloca aquí la lógica para navegar a la pantalla de perfil
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Hola, $username',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Anuncios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Aceptados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Salir',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
        ),
        onTap: (index) {
          if (index == 3) {
            // Índice 3 corresponde al ícono de salida
            _logout(context);
          } else {
            _onItemTapped(index);
          }
        },
      ),
    );
  }
}
