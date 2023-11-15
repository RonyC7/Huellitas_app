import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_aplicacion/blocs/paseo_bloc.dart'; // Asegúrate de importar tu BLoC
import 'package:tu_aplicacion/models/mascota.dart'; // Importa tus modelos según sea necesario

class PaseoForm extends StatefulWidget {
  @override
  _PaseoFormState createState() => _PaseoFormState();
}

class _PaseoFormState extends State<PaseoForm> {
  final _formKey = GlobalKey<FormState>();

  final _fechaInicioController = TextEditingController();
  final _horaInicioController = TextEditingController();
  final _ubicacionController = TextEditingController();
  final _descripcionController = TextEditingController();

  // Puedes usar una lista para mantener las mascotas seleccionadas
  List<Mascota> _mascotasSeleccionadas = [];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Aquí puedes enviar los datos a través de tu lógica o BLoC
      // Ejemplo: PaseoBLoC().add(NuevaSolicitudPaseo(fecha, hora, ubicacion, ...));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Paseo'),
      ),
      body: BlocConsumer<PaseoBLoC, PaseoState>(
        listener: (context, state) {
          // Lógica de escucha del BLoC, por ejemplo, manejar errores o redirecciones
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _fechaInicioController,
                      decoration: InputDecoration(labelText: 'Fecha de Inicio'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa la fecha de inicio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _horaInicioController,
                      decoration: InputDecoration(labelText: 'Hora de Inicio'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa la hora de inicio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _ubicacionController,
                      decoration:
                          InputDecoration(labelText: 'Ubicación del Servicio'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa la ubicación del servicio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _descripcionController,
                      decoration: InputDecoration(labelText: 'Descripción'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa una descripción';
                        }
                        return null;
                      },
                    ),
                    // CheckboxListTile para seleccionar mascotas
                    ListTile(
                      title: Text('Mascotas'),
                      subtitle: Text('Selecciona las mascotas para el paseo'),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      onTap: () {
                        // Abre un diálogo o pantalla para seleccionar mascotas
                        // Puedes implementar esto según tus necesidades
                      },
                    ),
                    // ... agrega más campos según tus necesidades

                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Enviar'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
