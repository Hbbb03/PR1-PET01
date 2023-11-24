import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App de Pruebas'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              // Obtener datos del usuario al azar (simula escaneo de QR)
              final response = await http.get(Uri.parse('http://localhost:3000/api/tudata'));
              final List<dynamic> userData = json.decode(response.body);
              final userId = userData[0]['_id']; // Asumiendo que hay al menos un usuario

              // Simular entrada de nuevo peso (ejemplo: 5 kg)
              final newWeight = 5;

              // Actualizar peso en la base de datos
              await http.put(
                Uri.parse('http://localhost:3000/api/tudata/$userId'),
                headers: {'Content-Type': 'application/json'},
                body: '{"peso": $newWeight}',
              );
              print('Peso actualizado con éxito');
            } catch (e) {
              print('Error: $e');
            }
          },
          child: Text('Simular Escaneo y Actualizar Peso'),
        ),
      ),
    );
  }
}
