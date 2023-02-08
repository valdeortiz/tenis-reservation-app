import 'package:tenis/src/models/cancha.dart';
import 'package:tenis/src/models/reservacion.dart';

class Canchas {
  static Cancha canchaPiso = const Cancha(
    titulo: 'Piso',
    dimensiones: '10x10',
    imagen: 'assets/canchaPiso.jpg',
    nombre: 'A',
  );
  static Cancha canchaTierra = const Cancha(
    titulo: 'Tierra',
    dimensiones: '20x20',
    imagen: 'assets/canchaTierra.jpg',
    nombre: 'B',
  );
  static Cancha canchaCesped = const Cancha(
    titulo: 'Cesped',
    dimensiones: '30x29',
    imagen: 'assets/canchaCesped.jpg',
    nombre: 'C',
  );
}

List CANCHAS = [Canchas.canchaCesped, Canchas.canchaPiso, Canchas.canchaTierra];
List RESERVACIONES = [
  Reservacion(
      fecha: DateTime.now(),
      usuario: 'valdemar',
      porcentajeLluvia: '30',
      cancha: Canchas.canchaCesped),
  Reservacion(
      fecha: DateTime.now().add(const Duration(days: 2)),
      usuario: 'milagros',
      porcentajeLluvia: '30',
      cancha: Canchas.canchaPiso),
  Reservacion(
      fecha: DateTime.now().add(const Duration(days: 1)),
      usuario: 'Juan',
      porcentajeLluvia: '20',
      cancha: Canchas.canchaTierra),
  Reservacion(
      fecha: DateTime.now().add(const Duration(days: 10)),
      usuario: 'Lola',
      porcentajeLluvia: '30',
      cancha: Canchas.canchaCesped),
];
