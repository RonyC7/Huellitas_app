import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:huellitas/Editar_solicitud_cliente.dart';

class SolicitudesClienteScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  SolicitudesClienteScreen({Key? key, required this.userData})
      : super(key: key);

  @override
  _SolicitudesClienteScreenState createState() =>
      _SolicitudesClienteScreenState();
}

class _SolicitudesClienteScreenState extends State<SolicitudesClienteScreen> {
  List<dynamic>? solicitudes;

  @override
  void initState() {
    super.initState();
    _fetchSolicitudes();
  }

  Future<void> _fetchSolicitudes() async {
    String username = widget.userData['username'];
    // URL de tu API para obtener las solicitudes
    String url = 'http://localhost:8000/api/solicitudes/$username/';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          // Acceder a la lista de solicitudes dentro del objeto JSON
          solicitudes = data['solicitudes'];
        });
      } else {
        // Manejar errores
        print('Error en la solicitud: ${response.statusCode}');
      }
    } catch (e) {
      // Manejar excepciones
      print('Error al obtener solicitudes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de solicitudes'),
        backgroundColor:
            Colors.lightBlueAccent, // Cambia esto al color que prefieras
      ),
      body: solicitudes == null || solicitudes!.isEmpty
          ? Center(child: Text('No tienes solicitudes de cuidado.'))
          : ListView.builder(
              itemCount: solicitudes!.length,
              itemBuilder: (context, index) {
                var solicitud = solicitudes![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color:
                        Colors.blue.shade100, // Color del fondo de la tarjeta
                    child: ExpansionTile(
                      title: Text(
                        'Solicitud #${solicitud['id']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Estado: ${solicitud['estado']}'),
                      leading: Icon(Icons.pets), // Icono de la mascota
                      children: <Widget>[
                        // Aquí puedes agregar los detalles que desees mostrar
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Inicio: ${solicitud['fecha_inicio']}'),
                              Text('Fin: ${solicitud['fecha_fin']}'),
                              Text('Descripción: ${solicitud['descripcion']}'),
                              Text('Precio: ${solicitud['precio']}'),
                              // Botones para acciones
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    child: Text('Ver detalles'),
                                    onPressed: () {
                                      // Navegar a la pantalla de detalles
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Editar'),
                                    onPressed: () {
                                      // Navegar a la pantalla de edición
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Eliminar'),
                                    onPressed: () {
                                      // Mostrar un diálogo de confirmación para eliminar
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
