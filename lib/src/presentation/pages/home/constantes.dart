import 'package:tenis/src/models/cancha.dart';
import 'package:tenis/src/models/reservacion.dart';

class Canchas {
  static Cancha canchaPiso = Cancha(
    titulo: 'Piso',
    dimensiones: '10x10',
    imagen: 'assets/canchaPiso.jpg',
    nombre: 'A',
  );
  static Cancha canchaTierra = Cancha(
    titulo: 'Tierra',
    dimensiones: '20x20',
    imagen: 'assets/canchaTierra.jpg',
    nombre: 'B',
  );
  static Cancha canchaCesped = Cancha(
    titulo: 'Cesped',
    dimensiones: '30x29',
    imagen: 'assets/canchaCesped.jpg',
    nombre: 'C',
  );
}

enum CanchasE { A, B, C }

List CANCHAS = [Canchas.canchaCesped, Canchas.canchaPiso, Canchas.canchaTierra];
List RESERVACIONES = [
  Reservacion(
      id: 0,
      fecha: DateTime.now(),
      nombreUsuario: 'valdemar',
      porcentajeLluvia: 30.0,
      cancha: Canchas.canchaCesped),
  Reservacion(
      id: 1,
      fecha: DateTime.now().add(const Duration(days: 2)),
      nombreUsuario: 'milagros',
      porcentajeLluvia: 30.0,
      cancha: Canchas.canchaPiso),
  Reservacion(
      fecha: DateTime.now().add(const Duration(days: 1)),
      id: 2,
      nombreUsuario: 'Juan',
      porcentajeLluvia: 20.0,
      cancha: Canchas.canchaTierra),
  Reservacion(
      id: 3,
      fecha: DateTime.now().add(const Duration(days: 10)),
      nombreUsuario: 'Lola',
      porcentajeLluvia: 30.0,
      cancha: Canchas.canchaCesped),
];
