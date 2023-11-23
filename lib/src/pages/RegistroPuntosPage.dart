import 'package:flutter/material.dart';
import 'package:flutter_application_1/MongoDBModel.dart';
import 'package:flutter_application_1/dbHelper/mongodb.dart';

class RegistroPuntosPage extends StatefulWidget {
  final String username;

  RegistroPuntosPage({this.username = "", Key? key}) : super(key: key);

  @override
  _RegistroPuntosPageState createState() => _RegistroPuntosPageState();
}

class _RegistroPuntosPageState extends State<RegistroPuntosPage> {
  List<MongoDbModel> userRecords = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      await MongoDatabase.connect();
      List<Map<String, dynamic>> recordsData =
          await MongoDatabase.getUserRecords(widget.username);

      List<MongoDbModel> records =
          recordsData.map((data) => MongoDbModel.fromJson(data)).toList();

      setState(() {
        userRecords = records;
      });

      print(records);
    } catch (e) {
      print('Error al cargar datos desde MongoDB: $e');
    }
  }

  @override
  void didUpdateWidget(covariant RegistroPuntosPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.username != oldWidget.username) {
      _loadUserData();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(userRecords);
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Puntos'),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Registros de Puntos para ${widget.username}',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              if (userRecords.isNotEmpty)
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text('Peso (g)'),
                      numeric: true,
                    ),
                    DataColumn(
                      label: Text('Puntos'),
                      numeric: true,
                    ),
                    DataColumn(label: Text('Fecha')),
                  ],
                  rows: userRecords
                      .map(
                        (record) => DataRow(
                          cells: [
                            DataCell(
                              Text(
                                record.peso.toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                record.puntos.toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                record.fecha.toLocal().toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              if (userRecords.isEmpty)
                Text(
                  'No se encontraron registros de puntos para ${widget.username}',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
