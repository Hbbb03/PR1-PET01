import 'dart:convert';

MongoDbModel welcomeFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String welcomeToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  String nombres;
  String email;
  int numeroCelular;
  String contrasena;
  String rol;
  int estado;
  DateTime fechaRegistro;
  DateTime fechaActualizacion;
  int peso; // Agregar el campo "Peso (g)"
  int puntos; // Agregar el campo "Puntos"
  DateTime fecha; // Agregar el campo "Fecha"

  MongoDbModel({
    required this.nombres,
    required this.email,
    required this.numeroCelular,
    required this.contrasena,
    required this.rol,
    required this.estado,
    required this.fechaRegistro,
    required this.fechaActualizacion,
    required this.peso,
    required this.puntos,
    required this.fecha,
  });

  factory MongoDbModel.fromJson(Map<String, dynamic> json) {
    return MongoDbModel(
      nombres: json["nombres"] ?? '',
      email: json["email"] ?? '',
      numeroCelular: json["numeroCelular"] ?? 0,
      contrasena: json["contrasena"] ?? '',
      rol: json["rol"] ?? '',
      estado: json["estado"] ?? 0,
      fechaRegistro: json["fechaRegistro"] != null
          ? DateTime.parse(json["fechaRegistro"])
          : DateTime
              .now(), // Puedes elegir un valor predeterminado o utilizar la fecha actual
      fechaActualizacion: json["fechaActualizacion"] != null
          ? DateTime.parse(json["fechaActualizacion"])
          : DateTime
              .now(), // Puedes elegir un valor predeterminado o utilizar la fecha actual
      peso: json["peso"] ?? 0,
      puntos: json["puntos"] ?? 0,
      fecha: json["fecha"] != null
          ? DateTime.parse(json["fecha"])
          : DateTime
              .now(), // Puedes elegir un valor predeterminado o utilizar la fecha actual
    );
  }

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "email": email,
        "numeroCelular": numeroCelular,
        "contrasena": contrasena,
        "rol": rol,
        "estado": estado,
        "fechaRegistro": fechaRegistro.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "peso": peso,
        "puntos": puntos,
        "fecha": fecha.toIso8601String(),
      };
}
