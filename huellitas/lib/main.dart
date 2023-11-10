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
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: screenHeight * 0.03), // Ajusta el margen superior
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        FractionallySizedBox(
                          widthFactor: screenWidth < 600
                              ? 0.9
                              : 0.8, // Ajusta el ancho según el tamaño de la pantalla
                          child: Image.asset(
                            'assets/images/ellipse-158.png',
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: FractionallySizedBox(
                            widthFactor: screenWidth < 600
                                ? 0.5
                                : 0.4, // Ajusta el ancho según el tamaño de la pantalla
                            child: Image.asset(
                              'assets/images/logo.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height:
                          screenHeight * 0.03), // Ajusta el espacio vertical
                  _buildSmallButton('Iniciar Sesión', () {
                    // Navegar a la página de iniciar sesión (ISeccion)
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ISeccionScreen(),
                    ));
                  }),
                  SizedBox(
                      height:
                          screenHeight * 0.01), // Ajusta el espacio vertical
                  _buildSmallButton('Registrarse', () {
                    // Navegar a la página de registro
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistroScreen(),
                    ));
                  }),
                  SizedBox(
                      height:
                          screenHeight * 0.03), // Ajusta el espacio vertical
                  FractionallySizedBox(
                    widthFactor: screenWidth < 600
                        ? 0.7
                        : 0.6, // Ajusta el ancho según el tamaño de la pantalla
                    child: Image.asset(
                      'assets/images/ellipse-159.png',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSmallButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 30.0, // Ajusta el padding vertical
          horizontal: 30.0, // Ajusta el padding horizontal
        ),
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
}
