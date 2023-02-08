import 'package:tenis/src/models/cancha.dart';

class Canchas {
  static Cancha canchaPiso = const Cancha(
    titulo: 'Piso',
    dimensiones: '10x10',
    imagen: 'assets/canchaPiso.jpg',
    subtitulo: 'A',
  );
  static Cancha canchaTierra = const Cancha(
    titulo: 'Tierra',
    dimensiones: '20x20',
    imagen: 'assets/canchaTierra.jpg',
    subtitulo: 'B',
  );
  static Cancha canchaCesped = const Cancha(
    titulo: 'Cesped',
    dimensiones: '30x29',
    imagen: 'assets/canchaCesped.jpg',
    subtitulo: 'C',
  );
}
