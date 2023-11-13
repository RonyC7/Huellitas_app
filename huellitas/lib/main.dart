import 'package:flutter/material.dart';
import 'ISeccion.dart';
import 'Registro.dart'; // Importa la página de registro

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

class MyAppBar extends AppBar {
  MyAppBar({Key? key, String? title})
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
          centerTitle: true, // Centra el título
        );
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MyAppBar(title: 'Bienvenidos'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth < 600
                          ? screenWidth * 0.9
                          : screenWidth * 0.8,
                      child: Image.asset('assets/images/ellipse-158.png'),
                    ),
                    Positioned(
                      top: 0,
                      child: SizedBox(
                        width: screenWidth < 600
                            ? screenWidth * 0.5
                            : screenWidth * 0.4,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildSmallButton('Iniciar Sesión', () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ISeccionScreen(),
                ));
              }),
              SizedBox(height: 10),
              _buildSmallButton('Registrarse', () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RegistroScreen(),
                ));
              }),
              SizedBox(height: 20),
              SizedBox(
                width:
                    screenWidth < 600 ? screenWidth * 0.7 : screenWidth * 0.6,
                child: Image.asset('assets/images/ellipse-159.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
      ),
      child: Text(
        text,
        style: TextStyle(color: Color(0xFF2DBDFE)),
      ),
    );
  }
}
