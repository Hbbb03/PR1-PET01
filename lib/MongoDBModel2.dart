import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel2 welcomeFromJson(String str) =>
    MongoDbModel2.fromJson(json.decode(str));

String welcomeToJson(MongoDbModel2 data) => json.encode(data.toJson());

class MongoDbModel2 {
  String nombre;
  String descripcion;
  int estado;
  BsonBinary imagen;
  String organizacion;
  DateTime fechaRegistro;
  DateTime fechaActualizacion;

  MongoDbModel2({
    required this.nombre,
    required this.descripcion,
    required this.estado,
    required this.imagen,
    required this.organizacion,
    required this.fechaRegistro,
    required this.fechaActualizacion,
  });

  factory MongoDbModel2.fromJson(Map<String, dynamic> json) {
    return MongoDbModel2(
      nombre: json["Nombre"] ?? '',
      descripcion: json["Descripcion"] ?? '',
      estado: json["Estado"] ?? 0,
      imagen: json["Imagen"] as BsonBinary? ?? BsonBinary.from([]),
      organizacion: json["Organizacion"] ?? '',
      fechaRegistro: json["FechaRegistro"] != null
          ? DateTime.parse(json["FechaRegistro"])
          : DateTime.now(),
      fechaActualizacion: json["FechaActualizacion"] != null
          ? DateTime.parse(json["FechaActualizacion"])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "Descripcion": descripcion,
        "Estado": estado,
        "Imagen": imagen,
        "Organizacion": organizacion,
        "FechaRegistro": fechaRegistro.toIso8601String(),
        "FechaActualizacion": fechaActualizacion.toIso8601String(),
      };
}
