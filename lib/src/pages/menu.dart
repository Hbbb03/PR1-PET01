import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';
import 'package:flutter_application_1/src/pages/RegistroPuntosPage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_application_1/dbHelper/mongodb.dart';
import 'package:flutter_application_1/MongoDBModel.dart';
import 'dart:typed_data';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        LoginPage.id: (context) => LoginPage(),
        '/qr_code': (context) => QrCodePage(),
        '/registro_puntos': (context) => RegistroPuntosPage(),
        '/campaña': (context) => CampanaPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
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
                color: Color(0xFFfbdfb9),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Bienvenido a Recicla Botellas PET',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(2, 43, 74, 1),
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
                color: Color.fromRGBO(2, 43, 74, 1),
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
                color: Color.fromRGBO(2, 43, 74, 1),
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
                color: Color.fromRGBO(2, 43, 74, 1),
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
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getUserDataFromDatabase(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error al obtener los datos de MongoDB: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null) {
            print('No se encontraron datos de usuario en MongoDB.');
            return Center(
                child: Text('No se encontraron datos de usuario en MongoDB.'));
          } else {
            print('Código QR generado correctamente: ${snapshot.data}');
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

  Future<Map<String, dynamic>> _getUserDataFromDatabase() async {
    final username = await obtenerNombreDeUsuario();

    await MongoDatabase.connect();
    MongoDbModel? userData =
        await MongoDatabase.getUserDataByUsername(username);

    if (userData != null) {
      return {
        "nom": userData.nombres,
        "cel": userData.numeroCelular.toString(),
      };
    } else {
      return {};
    }
  }

  Future<String> obtenerNombreDeUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? "Usuario de Prueba";
    return username;
  }
}

class CampanaPage extends StatefulWidget {
  @override
  _CampanaPageState createState() => _CampanaPageState();
}

class _CampanaPageState extends State<CampanaPage> {
  List<Map<String, dynamic>> campaniaData = [];

  @override
  void initState() {
    super.initState();
    _loadCampaniaData();
  }

  Future<void> _loadCampaniaData() async {
    try {
      await MongoDatabase.connect();
      MongoDatabase mongoDatabase = MongoDatabase();
      List<Map<String, dynamic>> campaniaDataList =
          await mongoDatabase.getCampaniaData();

      setState(() {
        campaniaData = campaniaDataList;
      });

      print(campaniaData);
    } catch (e) {
      print('Error al cargar datos de campañas desde MongoDB: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campañas'),
      ),
      body: Center(
        child: Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Lista de Campañas',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              if (campaniaData.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: campaniaData.length,
                    itemBuilder: (context, index) {
                      final campania = campaniaData[index];
                      return _buildCampanaCard(
                        campania['nombre'],
                        campania['descripcion'],
                        campania['imagen'],
                      );
                    },
                  ),
                ),
              if (campaniaData.isEmpty)
                Text(
                  'No se encontraron datos de campañas',
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCampanaCard(
      String title, String description, String imageBase64) {
    Uint8List imageBytes = base64.decode(imageBase64);

    return Card(
      elevation: 5,
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.memory(
            imageBytes,
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
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
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
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
        color: Colors.blueGrey,
        width: 200.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(246, 107, 14, 1.0), // Color del borde
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centra los elementos en el eje principal (horizontal)
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 3.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0), // Añade espacio vertical

                      Image.asset(
                        'assets/LogoOficial3.png',
                        width: 125,
                        height: 125,
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
                    builder: (context) => MyHomePage(),
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
                      fontSize: 20,
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
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final username =
                    prefs.getString('username') ?? "Usuario de Prueba";
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        RegistroPuntosPage(username: username),
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
                      fontSize: 20,
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
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.white),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirmación"),
                      content: Text("¿Estás seguro de querer salir?"),
                      actions: [
                        TextButton(
                          child: Text("Cancelar"),
                          onPressed: () {
                            Navigator.of(context).pop(); // Cierra el diálogo
                          },
                        ),
                        TextButton(
                          child: Text("Salir"),
                          onPressed: () {
                            Navigator.of(context).pop(); // Cierra el diálogo
                            Navigator.pushReplacementNamed(context, '/');
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Icon(Icons.exit_to_app, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Salir',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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

  Future<String> _getUserName() async {
    // Obtiene el nombre de usuario almacenado en SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? 'Usuario de Prueba';
  }
}
