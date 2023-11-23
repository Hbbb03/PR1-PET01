import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/welcome_page.dart';
import 'package:flutter_application_1/dbHelper/mongodb.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// ignore: unused_import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await MongoDatabase.connect();
    print("Conexión exitosa a MongoDB Atlas");
  } catch (e) {
    print("Error al conectar a MongoDB Atlas: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey, // Color principal de la aplicación
          scaffoldBackgroundColor:
              Color.fromRGBO(249, 232, 221, 1) // Color del borde
          ),
      home: WelcomePage(), // Cambia la página inicial a WelcomePage
    );
  }
}
