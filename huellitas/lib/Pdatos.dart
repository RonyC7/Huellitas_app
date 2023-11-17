import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:huellitas/Solicitudes_cliente.dart';
import 'package:huellitas/usuario.dart';
import 'chats.dart';
import 'Settings.dart';

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
    String username = widget.userData['username'];
    final url = Uri.parse('http://localhost:8000/api/inicio/$username/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          cuidadoresCercanos = responseData['cuidadores_cercanos'];
        });
      } else {
        print('Error en la respuesta del servidor: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al obtener cuidadores cercanos: $error');
    }
  }

  Widget _buildCuidadoresCercanosCarousel() {
    return cuidadoresCercanos != null && cuidadoresCercanos!.isNotEmpty
        ? CarouselSlider.builder(
            itemCount: cuidadoresCercanos!.length,
            itemBuilder: (context, index, realIndex) {
              final cuidador = cuidadoresCercanos![index];
              return Card(
                child: ListTile(
                  title: Text("${cuidador['nombre']}  ${cuidador['apellido']}"),
                  subtitle: Text('Distancia: ${cuidador['distance']} km'),
                  tileColor: Color(0xFF2DBDFE),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Aquí la lógica para contactar al cuidador
                    },
                    child: Text('Contactar'),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          )
        : Text('No hay cuidadores cercanos para mostrar.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2DBDFE),
        title: const Text('Huellitas',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        automaticallyImplyLeading: false, // Quita la flecha de retroceso
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Acción cuando se presiona el botón de perfil
              // Por ejemplo, navegar a la pantalla de perfil del usuario
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UsuarioScreen(
                          username: widget.userData[
                              'username']) /* Tu pantalla de perfil */));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Fondo de pantalla con huellas azules desaturadas
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                  255, 255, 255, 255), // Fondo blanco para desaturar el azul
              image: DecorationImage(
                image: AssetImage('assets/images/HuellaAzul.png'),
                repeat: ImageRepeat.repeat,
                scale: 3.0, // Escala para hacer las huellas más pequeñas
                colorFilter: ColorFilter.mode(
                  Colors.white
                      .withOpacity(0.8), // Mezclar con blanco para desaturar
                  BlendMode.lighten, // Modo de fusión para aclarar
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'CUIDAMOS TU MASCOTA',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2DBDFE),
                          backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Color(0xFF2DBDFE),
                    borderRadius:
                        BorderRadius.circular(10), // Bordes redondeados
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '¿Desea algún tipo de cuidado?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 252, 252, 252)),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[12],
                          borderRadius:
                              BorderRadius.circular(10), // Bordes redondeados
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción para "Publicar anuncio"
                          },
                          child: Text('Publicar anuncio',
                              style: TextStyle(fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue[50], // Color del botón
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Bordes redondeados
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Cuidadores cercanos a ti',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2DBDFE),
                      backgroundColor: Colors.white),
                ),
                cuidadoresCercanos != null && cuidadoresCercanos!.isNotEmpty
                    ? _buildCuidadoresCercanosCarousel()
                    : const Text('No hay cuidadores cercanos para mostrar.'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF2DBDFE),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UsuarioScreen(username: widget.userData['username']),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Extrae el username del mapa userData
                String username = widget.userData['username'];

                // Pasa el username a UsuarioScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsuarioScreen(username: username),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {}, // Navegación a la página de inicio
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
