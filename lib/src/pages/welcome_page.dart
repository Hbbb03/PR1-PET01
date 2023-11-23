import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/Registro.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WaveBackground(), // Fondo de olas de colores
        Scaffold(
          backgroundColor: Color.fromRGBO(32, 82, 117, 0.7),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BIENVENIDO A LA PET APP',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/LogoOficial3.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .transparent, // Hace que el fondo sea transparente
                    side: BorderSide(
                        color: Color.fromRGBO(
                            246, 107, 14, 1.0)), // Color del borde
                  ),
                  child: Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontFamily: 'Taviraj',
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 24, // Nuevo tamaño del texto
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la pantalla con el código QR
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QRCodeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .transparent, // Hace que el fondo sea transparente
                    side: BorderSide(
                        color: Color.fromRGBO(
                            246, 107, 14, 1.0)), // Color del borde
                  ),
                  child: Text(
                    'Continuar como Anónimo',
                    style: TextStyle(
                      fontFamily: 'Taviraj',
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 24, // Nuevo tamaño del texto
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registro()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .transparent, // Hace que el fondo sea transparente
                    side: BorderSide(
                        color: Color.fromRGBO(
                            246, 107, 14, 1.0)), // Color del borde
                  ),
                  child: Text(
                    'Registrarse',
                    style: TextStyle(
                      fontFamily: 'Taviraj',
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 24, // Nuevo tamaño del texto
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WaveBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [
              Color(0xFFF2E6CF).withOpacity(0.7), // Fondo
              Color(0xFF9CD2D3).withOpacity(0.7), // Color de la ola
            ],
          ],
          durations: [1300], // Reducido a la mitad para que sea más rápido
          heightPercentages: [0.80], // Reducido para hacerlo más pequeño
          gradientBegin: Alignment.topLeft,
          gradientEnd: Alignment.bottomRight,
        ),
        size: Size(
          double.infinity,
          double.infinity,
        ),
        waveAmplitude: 0,
      ),
    );
  }
}

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String qrData = "Activar"; // Texto que se mostrará en el código QR

    return Scaffold(
      appBar: AppBar(
        title: Text('Código QR Anónimo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: 20.0),
            Text(
              'Escanea este código para activar la maquina',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
