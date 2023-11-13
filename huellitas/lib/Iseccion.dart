import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Pdatos.dart';
import 'Employee.dart';

class ISeccionScreen extends StatefulWidget {
  @override
  _ISeccionScreenState createState() => _ISeccionScreenState();
}

class _ISeccionScreenState extends State<ISeccionScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;

  Future<void> _login() async {
    final url = Uri.parse('http://localhost:8000/api/login/');

    try {
      final response = await http.post(url, body: {
        'username': _usernameController.text,
        'password': _passwordController.text,
      });

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(responseData['error'])));
      } else {
        final user = responseData['user'];
        final token = responseData['token']; // Asume que el token está presente

        // Añade el token al userData para pasarlo a las pantallas
        user['token'] = token;

        if (user['is_customer']) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PdatosScreen(userData: user),
          ));
        } else if (user['is_employee']) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EmployeeScreen(userData: user),
          ));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Acceso no autorizado.')));
        }
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al conectar con el servidor')));
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión'),
        backgroundColor: Color(0xFF2DBDFE),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Ingresa tus datos',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Nombre de Usuario',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 30.0),
                      primary: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/HuellaAzul.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: Color(0xFF2DBDFE),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
