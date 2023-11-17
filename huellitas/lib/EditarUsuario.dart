import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditarUsuarioScreen extends StatefulWidget {
  final String username;

  EditarUsuarioScreen({Key? key, required this.username}) : super(key: key);

  @override
  _EditarUsuarioScreenState createState() => _EditarUsuarioScreenState();
}

class _EditarUsuarioScreenState extends State<EditarUsuarioScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  void initState() {
    super.initState();
    _cargarDatosUsuario();
  }

  Future<void> _cargarDatosUsuario() async {
    final response = await http.get(
      Uri.parse(
          'http://localhost:8000/api/listar_datos_propietario/${widget.username}'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        _usernameController.text = data['user']['username'] ?? '';
        _emailController.text = data['user']['email'] ?? '';
        // Asignar valores a otros controladores...
      });
    } else {
      print('Error al obtener datos: ${response.statusCode}');
    }
  }

  Future<void> _guardarCambios() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> requestBody = {
        'user': {
          'username': _usernameController.text,
          'email': _emailController.text,
        },
        'propietario': {
          'nombre': _nombreController.text,
          'apellido': _apellidoController.text,
          'direccion': _direccionController.text,
          'telefono': _telefonoController.text,
        },
      };

      final String username = widget.username;
      final response = await http.put(
        Uri.parse(
            'http://localhost:8000/api/editar_datos_propietario/$username/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        print('Cambios guardados correctamente');
        Navigator.of(context).pop();
      } else {
        print('Error al guardar cambios: ${response.statusCode}');
        print('Cuerpo de respuesta: ${response.body}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Usuario'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nombre de usuario',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa el nombre de usuario';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa el correo electrónico';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa el nombre';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: _apellidoController,
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa el apellido';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: _direccionController,
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa la dirección';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: _telefonoController,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa el teléfono';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: _guardarCambios,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                primary: Color(0xFF2DBDFE),
              ),
              child: Text(
                'Guardar Cambios',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Para actualizar tu ubicación, por favor hazlo a través de nuestra página web.',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
