import 'package:hive_flutter/hive_flutter.dart';

import 'cancha.dart';

part 'reservacion.g.dart';

@HiveType(typeId: 0)
class Reservacion extends HiveObject {
  Reservacion({
    required this.id,
    required this.fecha,
    required this.nombreUsuario,
    required this.porcentajeLluvia,
    required this.cancha,
  });
  @HiveField(0)
  final int id;
  @HiveField(1)
  final DateTime fecha;
  @HiveField(2)
  final String nombreUsuario;
  @HiveField(3)
  final double porcentajeLluvia;
  @HiveField(4)
  final Cancha cancha;

  static Reservacion fromJson(Map<String, dynamic> json) => Reservacion(
        id: json["id"],
        fecha: json["fecha"],
        nombreUsuario: json["usuario"],
        porcentajeLluvia: json["porcentajeLluvia"],
        cancha: json['cancha'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha": fecha,
        "nombreUsuario": nombreUsuario,
        "porcentajeLluvia": porcentajeLluvia,
        "cancha": cancha,
      };
}
