import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistroScreen extends StatefulWidget {
  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  String password2 = '';
  String userType = 'customer';

  Future<void> _register() async {
    final url = Uri.parse('http://localhost:8000/api/registro/');

    try {
      final response = await http.post(url, body: {
        'username': username,
        'email': email,
        'password1': password,
        'password2': password2,
        'user_type': userType,
      });

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(responseData['error'])));
      } else if (responseData['success'] != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(responseData['success'])));
        Navigator.pop(context); // Regresar a la pantalla anterior
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error inesperado')));
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('Error al conectar con el servidor' + error.toString())));
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
        backgroundColor: Color(0xFF2DBDFE),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Crear Cuenta',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => username = value,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Correo',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => email = value,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      onChanged: (value) => password = value,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Repetir Contraseña',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      onChanged: (value) => password2 = value,
                    ),
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Tipo de Usuario',
                          style: TextStyle(fontSize: 16.0)),
                    ),
                    RadioListTile<String>(
                      title: const Text('Cliente'),
                      value: 'customer',
                      groupValue: userType,
                      onChanged: (String? value) {
                        setState(() {
                          userType = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Cuidador'),
                      value: 'employee',
                      groupValue: userType,
                      onChanged: (String? value) {
                        setState(() {
                          userType = value!;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        primary: Colors.white, // Cambia el color del botón
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
                            'Registrarse',
                            style: TextStyle(
                              color:
                                  Color(0xFF2DBDFE), // Color original del texto
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
      ),
    );
  }
}
