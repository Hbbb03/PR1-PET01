import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/menu.dart';
import 'package:flutter_application_1/MongoDBModel.dart';
import 'package:flutter_application_1/dbHelper/mongodb.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';

  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    // Validar que el correo y la contraseña no estén vacíos
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showErrorDialog('Por favor, ingrese su correo y contraseña.');
      return;
    }

    // Consultar la base de datos para obtener los datos del usuario con el correo proporcionado
    final userData =
        await MongoDatabase.getUserDataByEmail(_emailController.text);

    print('Datos del usuario: $userData');
    if (userData == null) {
      // El usuario con ese correo no existe
      _showErrorDialog('Correo electrónico no registrado.');
      return;
    }

    // Verificar si la contraseña proporcionada coincide con la contraseña en la base de datos
    if (userData.contrasena != _passwordController.text) {
      // Contraseña incorrecta
      _showErrorDialog('Contraseña incorrecta.');
      return;
    }

    // Actualizar datos del usuario en SharedPreferences al iniciar sesión
    _updateUserDataInSharedPreferences(userData);

    // Si el inicio de sesión es exitoso, redirigir a la ventana de menú (menu.dart)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );

    _emailController.clear();
    _passwordController.clear();
  }

  // Función para actualizar datos del usuario en SharedPreferences
  void _updateUserDataInSharedPreferences(MongoDbModel userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', userData.nombres);
    // Puedes agregar otros datos del usuario según sea necesario
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/LogoOficial3.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
              style: TextStyle(
                fontFamily: 'Taviraj',
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20, // Nuevo tamaño del texto
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
              style: TextStyle(
                fontFamily: 'Taviraj',
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20, // Nuevo tamaño del texto
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                    color:
                        Color.fromRGBO(246, 107, 14, 1.0)), // Color del borde
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
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
