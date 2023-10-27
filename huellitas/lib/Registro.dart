import 'package:flutter/material.dart';
import 'ISeccion.dart'; // Importa la página de iniciar sesión (ISeccion)
import 'main.dart';

class RegistroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
        centerTitle: true,
        automaticallyImplyLeading: false, // Esto quita la flecha de navegación
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      'Nombre',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                        // Agrega las propiedades del campo de texto
                        ),
                    SizedBox(height: 10.0),
                    Text(
                      'Apellido',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                        // Agrega las propiedades del campo de texto
                        ),
                    SizedBox(height: 10.0),
                    Text(
                      'Nombre de Usuario',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                        // Agrega las propiedades del campo de texto
                        ),
                    SizedBox(height: 10.0),
                    Text(
                      'Contraseña',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                      // Agrega las propiedades del campo de texto para la contraseña
                      obscureText: true, // Para ocultar la contraseña
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Correo',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                        // Agrega las propiedades del campo de texto
                        ),
                    SizedBox(height: 10.0),
                    Text(
                      'Teléfono',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                        // Agrega las propiedades del campo de texto
                        ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón "Registrarse"
                  // Muestra un mensaje de "Usuario registrado"
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Usuario registrado'),
                    ),
                  );

                  // Navegar de vuelta a la página principal (main.dart)
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
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
              ElevatedButton(
                onPressed: () {
                  // Navegar de vuelta a la página principal (main.dart)
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
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
                      'Regresar',
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
