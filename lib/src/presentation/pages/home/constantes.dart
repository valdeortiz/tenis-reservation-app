import 'package:tenis/src/models/cancha.dart';

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

List CANCHAS = [Canchas.canchaCesped, Canchas.canchaPiso, Canchas.canchaTierra];
