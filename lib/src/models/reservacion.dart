import 'cancha.dart';

class Reservacion {
  final Cancha cancha;
  final DateTime fecha;
  final String usuario;
  final String porcentajeLluvia;
  Reservacion(
      {required this.fecha,
      required this.usuario,
      required this.porcentajeLluvia,
      required this.cancha});
}
