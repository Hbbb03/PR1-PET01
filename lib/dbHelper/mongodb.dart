import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter_application_1/MongoDBModel.dart';
import 'package:flutter_application_1/MongoDBModel2.dart';
import 'package:flutter_application_1/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import "package:pointycastle/export.dart";
import 'package:pointycastle/block/aes_fast.dart' show AESFastEngine;
import 'package:pointycastle/block/modes/cbc.dart' show CBCBlockCipher;
import 'package:pointycastle/paddings/pkcs7.dart' show PKCS7Padding;
import 'package:pointycastle/api.dart' as pointycastle;
import 'dart:math';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;

class MongoDatabase {
  static var db, userCollection, campaniaCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
    campaniaCollection = db.collection(Campania);
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        throw StateError("Something went wrong while inserting data.");
      }
    } catch (e) {
      print('Error in insert: $e');
      throw e;
    }
  }

  static Future<MongoDbModel?> getUserDataByEmail(String email) async {
    try {
      var result = await userCollection.findOne(where.eq("email", email));
      return result != null ? MongoDbModel.fromJson(result) : null;
    } catch (e) {
      print('Error in getUserDataByEmail: $e');
      throw e;
    }
  }

   static Future<MongoDbModel?> getUserDataByUsername(String username) async {
    try {
      var result = await userCollection.findOne(where.eq("nombres", username));
      if (result != null) {
        return MongoDbModel.fromJson(result);
      } else {
        return null;
      }
    } catch (e) {
      print('Error al obtener datos del usuario por nombre de usuario: $e');
      return null;
    }
  }

  static Future<List<Map<String, dynamic>>> getUserRecords(
      String username) async {
    try {
      print('Buscando registros de puntos para el usuario: $username');
      final userDataList = await userCollection
          .find(where.eq("nombres", username))
          .map((json) => {
                'nombres': json['nombres'],
                'peso': json['peso'],
                'puntos': json['puntos'],
                'fecha': json['fecha'],
              })
          .toList();

      print('Documentos encontrados: ${userDataList.length}');

      return userDataList.cast<Map<String, dynamic>>();
    } catch (e) {
      print('Error in getUserRecords: $e');
      throw e;
    }
  }

  static Uint8List decryptImage(
      Uint8List encryptedImage, String encryptionKey, String encryptionIV) {
    try {
      final key = Uint8List.fromList(utf8.encode(encryptionKey));
      final iv = Uint8List.fromList(utf8.encode(encryptionIV));

      final cbcCipher = CBCBlockCipher(AESFastEngine())
        ..init(
          false,
          ParametersWithIV<KeyParameter>(
            KeyParameter(key),
            iv,
          ),
        );

      final paddedDecryptedBytes =
          cbcCipher.process(Uint8List.fromList(encryptedImage));
      final unpaddedDecryptedBytes = removePadding(paddedDecryptedBytes);

      return Uint8List.fromList(unpaddedDecryptedBytes);
    } catch (e) {
      print('Error in decryptImage: $e');
      throw e;
    }
  }

  static List<int> removePadding(List<int> paddedData) {
    final lastByte = paddedData.last;
    final paddingLength = lastByte;
    return paddedData.sublist(0, paddedData.length - paddingLength);
  }

  Future<List<Map<String, dynamic>>> getCampaniaData() async {
    try {
      print('Obteniendo todos los datos de campaña');
      final campaniaDataList = await campaniaCollection.find().toList();

      return campaniaDataList
          .map((json) {
            try {
              final imagen = json['Imagen'] as BsonBinary?;
              if (imagen != null) {
                final imageBase64 = base64.encode(imagen.byteList!);

                return {
                  'nombre': json['Nombre'],
                  'descripcion': json['Descripcion'],
                  'imagen': imageBase64,
                };
              }
            } catch (e) {
              print('Error al procesar documento de campaña: $e');
            }
            return null;
          })
          .whereType<Map<String, dynamic>>()
          .toList();
    } catch (e) {
      print('Error in getCampaniaData: $e');
      throw e;
    }
  }
}
