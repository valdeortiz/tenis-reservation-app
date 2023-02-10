import 'package:hive/hive.dart';

part 'cancha.g.dart';

@HiveType(typeId: 1)
class Cancha extends ObjectDatabase {
  @HiveField(0)
  final String titulo;
  @HiveField(1)
  final String dimensiones;
  @HiveField(2)
  final String imagen;
  @HiveField(3)
  final String nombre;
  Cancha({
    required this.titulo,
    required this.dimensiones,
    required this.imagen,
    required this.nombre,
  });

  @override
  String toString() {
    return '$titulo - $nombre';
  }

  factory Cancha.fromJson(Map<String, dynamic> json) => Cancha(
        titulo: json["titulo"],
        dimensiones: json["dimensiones"],
        imagen: json["imagen"],
        nombre: json["nombre"],
      );
  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "dimensiones": dimensiones,
        "imagen": imagen,
        "nombre": nombre,
      };
}

abstract class ObjectDatabase {}
