import 'package:flutter/material.dart';
import 'chats.dart';
import 'Pdatos.dart';
import 'Settings.dart';

class AnunciosP extends StatelessWidget {
  final List<Mascota> mascotas = [
    Mascota(
      nombre: 'Bobby',
      imagen: 'assets/images/Perro1.png',
      descripcion: 'Bobby es un perro juguetón y amigable.',
    ),
    Mascota(
      nombre: 'Luna',
      imagen: 'assets/images/Gato1.png',
      descripcion: 'Luna es una gata cariñosa y tranquila.',
    ),
    Mascota(
      nombre: 'Samuel',
      imagen: 'assets/images/Hamster1.png',
      descripcion: 'Samuel es un hámster que le gusta comer mucho.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anuncios Publicados'),
        centerTitle: true, // Centra el título en la AppBar
      ),
      body: ListView.builder(
        itemCount: mascotas.length,
        itemBuilder: (context, index) {
          return MascotaCard(
            mascota: mascotas[index],
            onTapChat: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatsScreen()));
            },
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
              onPressed: () {},
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

class Mascota {
  final String nombre;
  final String imagen;
  final String descripcion;

  Mascota(
      {required this.nombre, required this.imagen, required this.descripcion});
}

class MascotaCard extends StatelessWidget {
  final Mascota mascota;
  final VoidCallback onTapChat;

  MascotaCard({required this.mascota, required this.onTapChat});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            mascota.imagen,
            width: 150.0,
            height: 180.0,
            fit: BoxFit.cover,
          ),
          Text(
            mascota.nombre,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            mascota.descripcion,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          ElevatedButton(
            onPressed: onTapChat, // Utiliza el callback para la navegación
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF2DBDFE),
            ),
            child: Text(
              'Chatear',
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
