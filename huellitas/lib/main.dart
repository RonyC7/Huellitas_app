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
                    Image.asset(
                      'assets/images/ellipse-158.png',
                      width: 500,
                      height: 265,
                    ),
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la página de iniciar sesión (ISeccion)
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ISeccionScreen(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  primary: Colors.white, // Cambia el color del botón
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/HuellaAzul.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: Color(0xFF2DBDFE), // Color original del texto
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la página de registro
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegistroScreen(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  primary: Colors.white, // Cambia el color del botón
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/HuellaAzul.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Registrarse',
                      style: TextStyle(
                        color: Color(0xFF2DBDFE), // Color original del texto
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Image.asset(
                'assets/images/ellipse-159.png',
                width: 400,
                height: 242,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
