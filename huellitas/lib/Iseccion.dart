import 'package:flutter/material.dart';
import 'Pdatos.dart';

class ISeccionScreen extends StatefulWidget {
  @override
  _ISeccionScreenState createState() => _ISeccionScreenState();
}

class _ISeccionScreenState extends State<ISeccionScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: ''),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Text(
                'Ingresa tus datos',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              _buildInputField('Nombre de Usuario', 'Nombre de Usuario'),
              _buildInputField('Contraseña', 'Contraseña', isPassword: true),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                  Text('Guardar datos'),
                ],
              ),
              SizedBox(height: 20.0),
              _buildSmallButton('Iniciar Sesión', () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PdatosScreen(),
                ));
              }),
              SizedBox(height: 10.0),
              _buildSmallButton('Regresar', () {
                Navigator.of(context).pop();
              }),
              SizedBox(height: 20.0),
              // Mostrar 25 imágenes de perros y otros animales
              Wrap(
                children: List.generate(24, (index) {
                  return Image.asset(
                    _getRandomAnimalImage(index),
                    width: 40,
                    height: 40,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint,
      {bool isPassword = false}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          width: 300.0,
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
            ),
            obscureText: isPassword,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildSmallButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        primary: Colors.white, // Cambia el color del botón
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF2DBDFE), // Color original del texto
        ),
      ),
    );
  }

  String _getRandomAnimalImage(int index) {
    // Lista de nombres de imágenes de perros y otros animales
    final animalImages = [
      'PerroGold',
      'PerroNegro',
      'PerroNegro2',
      'PerroPequeno',
      'PerroBlanco',
      'icono1',
      'icono2',
      'icono3',
      'icono4',
      'Tortuga',
      'Gatito',
      'Hamster',
      'Cacatua',
      'Pez',
    ];
    // Obtén una imagen de perro o animal aleatoria
    final randomAnimal = animalImages[index % animalImages.length];
    return 'assets/images/$randomAnimal.png';
  }
}

class MyAppBar extends AppBar {
  MyAppBar({Key? key, String? title, bool automaticallyImplyLeading = false})
      : super(
          key: key,
          title: Text(
            title ?? '',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: automaticallyImplyLeading,
        );
}
