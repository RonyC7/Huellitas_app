import 'package:flutter/material.dart';
import 'chats.dart';
import 'Pdatos.dart';
import 'Settings.dart';

class Bcuidador extends StatefulWidget {
  @override
  _BcuidadorState createState() => _BcuidadorState();
}

class _BcuidadorState extends State<Bcuidador> {
  List<Cuidador> cuidadores = [
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

  bool _searching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searching
            ? TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  icon: Icon(Icons.search),
                ),
                onChanged: (query) {
                  setState(() {
                    cuidadores = _filterCuidadores(query);
                  });
                },
              )
            : Center(child: Text('Buscar Cuidador')),
        actions: [
          IconButton(
            icon: Icon(_searching ? Icons.cancel : Icons.search),
            onPressed: () {
              setState(() {
                _searching = !_searching;
                _searchController.clear();
                cuidadores = _filterCuidadores('');
              });
            },
          ),
        ],
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

  List<Cuidador> _filterCuidadores(String query) {
    if (query.isEmpty) {
      return [
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
    } else {
      return cuidadores
          .where((cuidador) =>
              cuidador.nombre.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
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
            height: 180.0,
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
