import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';

class EditarSolicitudScreen extends StatefulWidget {
  final String username;
  final int solicitudId;

  EditarSolicitudScreen({
    Key? key,
    required this.username,
    required this.solicitudId,
  }) : super(key: key);

  @override
  _EditarSolicitudScreenState createState() => _EditarSolicitudScreenState();
}

class _EditarSolicitudScreenState extends State<EditarSolicitudScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final Location location = Location();

  // Controladores para los campos del formulario
  late TextEditingController _ubicacionController;

  @override
  void initState() {
    super.initState();
    _ubicacionController = TextEditingController();
  }

  @override
  void dispose() {
    _ubicacionController.dispose();
    super.dispose();
  }

  Future<void> _obtenerUbicacionActual() async {
    final LocationData locationData = await location.getLocation();
    setState(() {
      _ubicacionController.text =
          '${locationData.latitude}, ${locationData.longitude}';
    });
  }

  Future<void> _updateSolicitud() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    // Aquí tu lógica para enviar los datos actualizados a la API
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Solicitud #${widget.solicitudId}'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      controller: _ubicacionController,
                      decoration: InputDecoration(
                        labelText: 'Ubicación',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.my_location),
                          onPressed: _obtenerUbicacionActual,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese una ubicación';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: _updateSolicitud,
                      child: Text('Actualizar Solicitud'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
