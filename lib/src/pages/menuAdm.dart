import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';
import 'package:flutter_application_1/src/pages/RegistroPuntosPage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyAdmPage(),
        LoginPage.id: (context) => LoginPage(),
        '/qr_code': (context) => QrCodePage(),
        '/registro_puntos': (context) => RegistroPuntosPage(),
        '/campaña': (context) => CampanaPage(),
      },
    );
  }
}

class MyAdmPage extends StatelessWidget {
  final List<String> carouselImages = [
    'assets/car1.jpg',
    'assets/car2.jpg',
    'assets/car3.jpeg',
    'assets/car4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
      ),
      drawer: MiDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[100],
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Bienvenido a Recicla Botellas PET',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 200.0,
                    child: PageView.builder(
                      itemCount: carouselImages.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          carouselImages[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(height: 20.0),

            // Sección "Acerca del reciclaje de botellas PET"
            Text(
              'Acerca del reciclaje de botellas PET',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'En nuestra aplicación, nos preocupamos por el medio ambiente y promovemos el reciclaje de botellas PET. Ayudamos a que tus botellas PET sean recicladas de manera efectiva y ecológica. Únete a nosotros en nuestro esfuerzo por hacer del mundo un lugar más verde y limpio.',
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 20.0),

            // Sección "Preguntas frecuentes"
            Text(
              'Preguntas frecuentes',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            Image.asset(
              'assets/imagen3.jpeg',
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(height: 10.0),

            ExpansionTile(
              title: Text(
                '¿Cómo puedo reciclar mis botellas PET?',
                style: TextStyle(fontSize: 18.0),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Para reciclar tus botellas PET, sigue estos pasos:\n'
                    '1. Lava y enjuaga las botellas para eliminar residuos.\n'
                    '2. Retira las etiquetas y tapas.\n'
                    '3. Lleva las botellas a un centro de reciclaje cercano o colócalas en tu contenedor de reciclaje habitual.',
                    style: TextStyle(fontSize: 16.0, color: Colors.black87),
                  ),
                ),
              ],
            ),

            ExpansionTile(
              title: Text(
                '¿Cómo puedo conocer los centros de reciclaje cercanos?',
                style: TextStyle(fontSize: 18.0),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Puedes encontrar centros de reciclaje cercanos utilizando nuestra aplicación. Simplemente ingresa tu ubicación y te mostraremos los centros de reciclaje más cercanos a ti.',
                    style: TextStyle(fontSize: 16.0, color: Colors.black87),
                  ),
                ),
              ],
            ),

            ExpansionTile(
              title: Text(
                '¿Cuál es el proceso de reciclaje de botellas PET?',
                style: TextStyle(fontSize: 18.0),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'El proceso de reciclaje de botellas PET involucra los siguientes pasos:\n'
                    '1. Recolecta de botellas PET usadas.\n'
                    '2. Clasificación y separación por colores.\n'
                    '3. Limpieza y trituración.\n'
                    '4. Fundición y extrusión para producir nuevos productos de plástico.',
                    style: TextStyle(fontSize: 16.0, color: Colors.black87),
                  ),
                ),
              ],
            ),

            ExpansionTile(
              title: Text(
                '¿Qué beneficios tiene el reciclaje de botellas PET?',
                style: TextStyle(fontSize: 18.0),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'El reciclaje de botellas PET tiene varios beneficios:\n'
                    '- Reduce la contaminación ambiental.\n'
                    '- Ahorra energía en comparación con la producción de plástico virgen.\n'
                    '- Conserva recursos naturales.\n'
                    '- Contribuye a la economía circular y al empleo.',
                    style: TextStyle(fontSize: 16.0, color: Colors.black87),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.0),

            // Sección "Novedades"
            Text(
              'Novedades',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            Container(
              width: 200.0,
              height: 200.0,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/imagen4.jpeg',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: 10.0),

            // Novedad 1 (Campaña nueva)
            ListTile(
              title: Text(
                '¡Nueva campaña de reciclaje!',
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                'Participa en nuestra última campaña de reciclaje y gana premios increíbles. ¡Ayúdanos a reciclar más botellas PET y cuidar nuestro planeta!',
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
              ),
            ),

            // Resto del contenido de novedades (puedes agregar más novedades si es necesario)

            SizedBox(height: 20.0),

            // Botón de ejemplo para ir a la página de código QR
            ElevatedButton(
              onPressed: () {
                // Acción del botón
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
              child: Text(
                'Explorar más',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GlobalScaffold extends StatelessWidget {
  final Widget body;
  GlobalScaffold({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'), // Cambia el título según la página
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: MiDrawer(),
      body: body, // El cuerpo de la página se pasa como argumento
    );
  }
}

class QrCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: FutureBuilder<Map<String, String>>(
        future: _getUserDataFromPreferences(context),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se obtiene el valor
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Manejar el error aquí si es necesario
            print(
                'Error al obtener los datos de SharedPreferences: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            // Manejar el caso en que el valor sea null o no esté disponible
            print('No se encontró un código QR guardado.');
            return Center(child: Text('No se encontró un código QR guardado.'));
          } else {
            print('Código QR recuperado correctamente: ${snapshot.data}');
            // El valor se obtuvo correctamente, puedes usarlo aquí
            return Center(
              child: QrImageView(
               data: jsonEncode(snapshot.data!),
                version: QrVersions.auto,
                size: 200.0,
              ),
            );
          }
        },
      ),
    );
  }
  Future<Map<String, String>> _getUserDataFromPreferences(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final username = prefs.getString('username') ?? '';
  final celular = prefs.getString('celular') ?? '';

  if (username.isEmpty || celular.isEmpty) {
    // Si falta alguno de los datos, muestra un mensaje y redirige al login
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Error: No se encontraron datos de usuario.'),
      duration: Duration(seconds: 2),
    ));
    // Puedes redirigir al usuario al login u otra página de manejo de errores
    Navigator.pushReplacementNamed(context, LoginPage.id);
  }

  return {'username': username, 'celular': celular};
}

}



class CampanaPage extends StatelessWidget {
  final List<String> carouselImages = [
    'assets/campana3.png',
    'assets/campana2.png',
    'assets/campana1.png',
    'assets/campana4.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[100],
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Participa en nuestras emocionantes campañas',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 200.0,
                    child: PageView.builder(
                      itemCount: carouselImages.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          carouselImages[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(height: 20.0),

            // Campañas
            _buildCampanaCard(
              'Recicla y Gana',
              '¡Ayuda al planeta y gana premios!',
              'Participa en nuestra campaña de reciclaje y podrías ganar emocionantes premios mientras contribuyes al cuidado del medio ambiente.',
              'assets/campana1.png',
            ),
            _buildCampanaCard(
              'Tarjetas de Regalo por Reciclar',
              'Gana tarjetas de regalo',
              'Recicla tus botellas PET y podrías ganar tarjetas de regalo por valor de \$100. ¡Es tu oportunidad de ser recompensado por reciclar!',
              'assets/campana2.png',
            ),
            _buildCampanaCard(
              'Sorteo de Productos Sustentables',
              '¡Productos ecológicos te esperan!',
              'Participa en nuestro sorteo de productos ecológicos de última generación. Cada botella reciclada te acerca más a estos increíbles premios.',
              'assets/campana3.png',
            ),
            _buildCampanaCard(
              'Cena Sostenible para Dos',
              'Gana una cena romántica',
              'Recicla y podrías ganar una cena romántica para dos personas en un restaurante que promueve prácticas sostenibles. ¡Una velada inolvidable a la luz de las velas te espera!',
              'assets/campana4.jpeg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampanaCard(
    String title,
    String subTitle,
    String description,
    String imageUrl,
  ) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
            ),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          ExpansionTile(
            title: Text('Más detalles'),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Acción al presionar el botón "Participar"
                },
                child: Text('Participar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmación'),
        content: Text('¿Estás seguro de que deseas cerrar la sesión?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo
            },
          ),
          TextButton(
            child: Text('Aceptar'),
            onPressed: () {
              // Realiza aquí la acción de cierre de sesión
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      );
    },
  );
}

class MiDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green[900],
        width: 200.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[700],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Alinea la imagen en la parte superior
                children: [
                  Image.asset(
                    'assets/usu.jpeg',
                    width: 50.0,
                    height: 60.0,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0), // Añade espacio vertical
                      Text(
                        'Andres Castel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      Image.asset(
                        'assets/logoPrincipal.png',
                        width: 90.0,
                        height: 90.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyAdmPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.home, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Menú Principal',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginPage.id);
              },
              child: Row(
                children: [
                  Icon(Icons.login, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Inicio de Sesión',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => QrCodePage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.qr_code, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Código QR',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegistroPuntosPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Registro Puntos',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CampanaPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.campaign, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Campañas',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyAdmPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.campaign, color: Colors.white),
                  SizedBox(width: 10),
                  Icon(Icons.add, color: Colors.white), // Icono adicional
                  SizedBox(width: 10),
                  Text(
                    'Añadir Campaña',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.white),
            TextButton(
              onPressed: () {
                _showLogoutConfirmationDialog(context);
              },
              child: Row(
                children: [
                  Icon(Icons.exit_to_app, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Salir',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
