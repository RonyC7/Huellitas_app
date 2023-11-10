import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'chats.dart';
import 'Settings.dart';
import 'usuario.dart';
import 'Anuncio.dart';
import 'Bcuidador.dart';
import 'AnunciosP.dart';
import 'Mascotas.dart';

class PdatosScreen extends StatefulWidget {
  @override
  _PdatosScreenState createState() => _PdatosScreenState();
}

class _PdatosScreenState extends State<PdatosScreen> {
  double _sliderValue = 100.0;
  int _currentIndex = 0;

  final List<String> recomendados = [
    'assets/images/logo.png',
    'assets/images/HuellaAzul.png',
    'assets/images/logo.png',
    'assets/images/HuellaAzul.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2DBDFE),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/HuellaBlanca.png',
              width: 40.0,
              height: 40.0,
            ),
            Text(
              'Pagina principal',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UsuarioScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnuncioScreen()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2DBDFE),
              ),
              child: Text(
                'Publicar Anuncio',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Recomendados',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2DBDFE),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            CarouselSlider(
              items: recomendados.map((recomendado) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF2DBDFE),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(recomendado),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () {
                              // Acción al presionar "Seguir"
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF2DBDFE),
                            ),
                            child: Text(
                              'Seguir',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () {
                              // Acción al presionar "Ver Más"
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF2DBDFE),
                            ),
                            child: Text(
                              'Ver Más',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                initialPage: _currentIndex,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Bcuidador()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2DBDFE),
              ),
              child: Text(
                'Buscar cuidador',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnunciosP()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2DBDFE),
              ),
              child: Text(
                'Anuncios publicados',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MascotasScreen()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2DBDFE),
              ),
              child: Text(
                'Mis Mascotas',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF2DBDFE),
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
                // Agrega la navegación a la página PdatosScreen o la página de inicio correcta
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
