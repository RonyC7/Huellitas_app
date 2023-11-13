import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PdatosScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  PdatosScreen({Key? key, required this.userData}) : super(key: key);

  @override
  _PdatosScreenState createState() => _PdatosScreenState();
}

class _PdatosScreenState extends State<PdatosScreen> {
  List<dynamic>? cuidadoresCercanos;

  @override
  void initState() {
    super.initState();
    _fetchCuidadoresCercanos();
  }

  Future<void> _fetchCuidadoresCercanos() async {
    // Obtén el username del usuario
    String username = widget.userData['username'];

    // Usa el username en la URL
    final url = Uri.parse('http://localhost:8000/api/inicio/$username/');
    try {
      final response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          cuidadoresCercanos = responseData['cuidadores_cercanos'];
        });
      } else {
        print(
            'Error en la respuesta del servidor: ${response.statusCode}: ${response.body}');
      }
    } catch (error) {
      print('Error al obtener cuidadores cercanos: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuidadores Cercanos'),
        backgroundColor: Color(0xFF2DBDFE),
      ),
      body: _buildCuidadoresCercanos(),
    );
  }

  Widget _buildCuidadoresCercanos() {
    return cuidadoresCercanos != null
        ? ListView.builder(
            itemCount: cuidadoresCercanos!.length,
            itemBuilder: (context, index) {
              final cuidador = cuidadoresCercanos![index];
              return ListTile(
                title: Text(cuidador['nombre']),
                subtitle: Text('Distancia: ${cuidador['distance']} km'),
              );
            },
          )
        : Center(child: CircularProgressIndicator());
  }
}
