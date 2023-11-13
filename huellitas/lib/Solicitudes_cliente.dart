import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        title: Text('Listado de Solicitudes de Cuidado'),
      ),
      body: solicitudes == null || solicitudes!.isEmpty
          ? Center(child: Text('No tienes solicitudes de cuidado.'))
          : ListView.builder(
              itemCount: solicitudes!.length,
              itemBuilder: (context, index) {
                var solicitud = solicitudes![index];
                return Card(
                  child: ExpansionTile(
                    title: Text(
                        'Solicitud #${solicitud['id']} - ${solicitud['tipo_de_cuidado']} - Estado: ${solicitud['estado']}'),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'Inicio: ${solicitud['fecha_inicio']} a las ${solicitud['hora_inicio']}'),
                        subtitle: Text(
                            'Fin: ${solicitud['fecha_fin']} a las ${solicitud['hora_fin']}'),
                      ),
                      ListTile(
                        title: Text('Descripción: ${solicitud['descripcion']}'),
                        subtitle: Text('Precio: Q${solicitud['precio']}'),
                      ),
                      // Agregar más detalles aquí si es necesario
                      ButtonBar(
                        children: <Widget>[
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
                );
              },
            ),
    );
  }
}
