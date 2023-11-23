import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/menu.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/MongoDBModel.dart';
import 'package:flutter_application_1/dbHelper/mongodb.dart';
import 'dart:convert';
import 'dart:math';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController celularController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController confirmarContrasenaController =
      TextEditingController();

  Future<String> obtenerNombreDeUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? "Usuario de Prueba";
    return username;
  }

  void _registrarUsuario() async {
    // Validar campos vacíos
    if (nombreController.text.isEmpty ||
        correoController.text.isEmpty ||
        celularController.text.isEmpty ||
        contrasenaController.text.isEmpty ||
        confirmarContrasenaController.text.isEmpty) {
      mostrarError('Por favor, complete todos los campos.');
      return;
    }

    // Validar que las contraseñas coincidan
    if (contrasenaController.text != confirmarContrasenaController.text) {
      mostrarError('Las contraseñas no coinciden.');
      return;
    }

    // Obtener el nombre de usuario asincrónicamente
    final username = await obtenerNombreDeUsuario();

    await _insertData(
      nombreController.text,
      correoController.text,
      int.tryParse(celularController.text) ?? 0,
    );

    // Crear un mapa con los datos del usuario
    Map<String, dynamic> userDataMap = {
      "nom": nombreController.text,
      "cel": celularController.text
    };

    // Guardar los datos en SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userDataNom', nombreController.text);
    prefs.setString('userDataCel', celularController.text);

    String userDataJson = jsonEncode(userDataMap);

    // Mostrar el código QR al usuario
    mostrarCodigoQR(userDataJson);
  }

  void mostrarCodigoQR(String jsonData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QRPage(data: jsonData),
      ),
    );
  }

  Future<void> _insertData(
      String nombres, String email, int numeroCelular) async {
    // Validar que los campos no estén vacíos
    if (nombres.isEmpty || email.isEmpty) {
      mostrarError('Por favor, complete todos los campos.');
      return;
    }
    final random = Random();
    final peso = random.nextInt(10000);
    final puntos = random.nextInt(100);
    final fecha = DateTime.now();

    // Crear un objeto MongoDbModel con los datos del formulario
    MongoDbModel userData = MongoDbModel(
      nombres: nombreController.text,
      email: correoController.text,
      numeroCelular: int.parse(celularController.text),
      contrasena: contrasenaController.text,
      rol: 'user',
      estado: 1,
      fechaRegistro: DateTime.now(),
      fechaActualizacion: DateTime.now(),
      peso: peso,
      puntos: puntos,
      fecha: fecha,
    );

    // Conectar a MongoDB Atlas y realizar la inserción de datos
    await MongoDatabase.connect();
    String result = await MongoDatabase.insert(userData);

    if (result == "Data Inserted") {
      mostrarMensaje('Usuario registrado exitosamente.');

      // Guardar datos en SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', nombreController.text);

      // Mostrar el código QR al usuario
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QRPage(data: userData.toJson().toString()),
        ),
      );
      prefs = await SharedPreferences.getInstance();
      prefs.setString('user_qr_code', userData.toJson().toString());
    } else {
      mostrarError('Error al registrar usuario: $result');
    }
  }

  void mostrarError(String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(mensaje),
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

  void mostrarMensaje(String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mensaje'),
          content: Text(mensaje),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/LogoOficial3.png',
                width: 200,
                height: 200,
              ),
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                style: TextStyle(
                  fontFamily: 'Taviraj',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20, // Nuevo tamaño del texto
                ),
              ),
              TextFormField(
                controller: correoController,
                decoration: InputDecoration(labelText: 'Correo'),
                style: TextStyle(
                  fontFamily: 'Taviraj',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20, // Nuevo tamaño del texto
                ),
              ),
              TextFormField(
                controller: celularController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Número de Celular'),
                style: TextStyle(
                  fontFamily: 'Taviraj',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20, // Nuevo tamaño del texto
                ),
              ),
              TextFormField(
                controller: contrasenaController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Contraseña'),
                style: TextStyle(
                  fontFamily: 'Taviraj',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20, // Nuevo tamaño del texto
                ),
              ),
              TextFormField(
                controller: confirmarContrasenaController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
                style: TextStyle(
                  fontFamily: 'Taviraj',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20, // Nuevo tamaño del texto
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_validateInput()) {
                    _registrarUsuario();
                  }
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                      color:
                          Color.fromRGBO(246, 107, 14, 1.0)), // Color del borde
                ),
                child: Text(
                  'Registrarse',
                  style: TextStyle(
                    fontFamily: 'Taviraj',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24, // Nuevo tamaño del texto
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateInput() {
    if (nombreController.text.isEmpty) {
      mostrarError('Por favor, ingrese su nombre.');
      return false;
    }

    if (correoController.text.isEmpty) {
      mostrarError('Por favor, ingrese su correo.');
      return false;
    }

    if (!isValidEmail(correoController.text)) {
      mostrarError('Por favor, ingrese un correo válido.');
      return false;
    }

    if (celularController.text.isEmpty) {
      mostrarError('Por favor, ingrese su número de celular.');
      return false;
    }

    if (!isValidPhoneNumber(celularController.text)) {
      mostrarError('Por favor, ingrese un número de celular válido.');
      return false;
    }

    if (contrasenaController.text.isEmpty) {
      mostrarError('Por favor, ingrese su contraseña.');
      return false;
    }
    if (contrasenaController.text.length < 7) {
      mostrarError('La contraseña debe tener al menos 7 caracteres.');
      return false;
    }

    if (confirmarContrasenaController.text.isEmpty) {
      mostrarError('Por favor, confirme su contraseña.');
      return false;
    }

    if (contrasenaController.text != confirmarContrasenaController.text) {
      mostrarError('Las contraseñas no coinciden.');
      return false;
    }

    return true;
  }

  bool isValidEmail(String email) {
    // Utiliza una expresión regular para validar el formato del correo
    // Puedes personalizar la expresión regular según tus requisitos
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  bool isValidPhoneNumber(String phoneNumber) {
    // Puedes utilizar una expresión regular o cualquier otro método para validar el número de teléfono
    // Asegúrate de personalizar la validación según tus requisitos
    // Aquí, simplemente estamos comprobando si el valor es un número entero válido.
    try {
      int.parse(phoneNumber);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class QRPage extends StatelessWidget {
  final String data;

  QRPage({required this.data});

  @override
  Widget build(BuildContext context) {
    // No es necesario formatear la cadena JSON
    // simplemente pasa la cadena JSON como está
    return Scaffold(
      appBar: AppBar(title: Text('Código QR')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: data, // Utiliza la cadena JSON sin formatear
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                    color:
                        Color.fromRGBO(246, 107, 14, 1.0)), // Color del borde
              ),
              child: Text(
                'Ir a Home',
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
}
