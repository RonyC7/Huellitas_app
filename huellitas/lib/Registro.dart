import 'package:flutter/material.dart';
import 'ISeccion.dart'; // Importa la página de iniciar sesión (ISeccion)
import 'main.dart';

class RegistroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
        centerTitle: true,
        automaticallyImplyLeading: false, // Esto quita la flecha de navegación
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    _buildInputField('Nombre', 'Nombre de Usuario'),
                    _buildInputField('Apellido', 'Apellido'),
                    _buildInputField('Nombre de Usuario', 'Nombre de Usuario'),
                    _buildInputField('Contraseña', 'Contraseña',
                        isPassword: true),
                    _buildInputField('Correo', 'Correo Electrónico'),
                    _buildInputField('Teléfono', 'Teléfono'),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              _buildSmallButton('Registrarse', () {
                // Lógica para el botón "Registrarse"
                // Muestra un mensaje de "Usuario registrado"
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Usuario registrado'),
                  ),
                );

                // Navegar de vuelta a la página principal (main.dart)
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              }),
              SizedBox(height: 10.0),
              _buildSmallButton('Regresar', () {
                // Navegar de vuelta a la página principal (main.dart)
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint,
      {bool isPassword = false}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          width: 300.0,
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
            ),
            obscureText: isPassword,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildSmallButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        primary: Colors.white, // Cambia el color del botón
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF2DBDFE), // Color original del texto
        ),
      ),
    );
  }
}
