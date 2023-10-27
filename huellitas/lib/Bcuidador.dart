import 'package:flutter/material.dart';
import 'chats.dart';
import 'Pdatos.dart';
import 'Settings.dart';

class Bcuidador extends StatelessWidget {
  final List<Cuidador> cuidadores = [
    Cuidador(
      nombre: 'Juan',
      valoracion: 4.5,
      imagen: 'assets/images/Prueba2.png',
    ),
    Cuidador(
      nombre: 'Luis',
      valoracion: 4.2,
      imagen: 'assets/images/Prueba3.png',
    ),
    Cuidador(
      nombre: 'Martha',
      valoracion: 4.8,
      imagen: 'assets/images/Prueba4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Buscar Cuidador'),
        ),
      ),
      body: ListView.builder(
        itemCount: cuidadores.length,
        itemBuilder: (context, index) {
          return CuidadorCard(
            cuidador: cuidadores[index],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatsScreen()));
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PdatosScreen()));
              },
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

class Cuidador {
  final String nombre;
  final double valoracion;
  final String imagen;

  Cuidador(
      {required this.nombre, required this.valoracion, required this.imagen});
}

class CuidadorCard extends StatelessWidget {
  final Cuidador cuidador;

  CuidadorCard({required this.cuidador});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            cuidador.imagen,
            width: 150.0,
            height:
                180.0, // Ajusta la altura para hacer las imágenes un poco más largas
            fit: BoxFit.cover,
          ),
          Text(
            cuidador.nombre,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Valoración: ${cuidador.valoracion.toStringAsFixed(1)}',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatsScreen()));
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF2DBDFE),
            ),
            child: Text(
              'Chat',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
