import 'package:flutter_test/flutter_test.dart';
import 'package:tenis/src/models/models.dart';
import 'package:tenis/src/presentation/pages/home/constantes.dart';

void main() {
  test('verificacion del modelo Reserva(fromJson-toJson)', () {
    // Verificamos este modelo poorque es el principal
    // Y tambien se verifica el modelo cancha
    Reservacion reserva = Reservacion(
      id: 1,
      cancha: Canchas.canchaCesped,
      fecha: DateTime.now(),
      nombreUsuario: 'prueba',
      porcentajeLluvia: 12.0,
    );

    Map<String, dynamic> aux = reserva.toJson();

    Reservacion result = Reservacion.fromJson(aux);

    final bool success = (reserva.id == result.id &&
        reserva.nombreUsuario == result.nombreUsuario &&
        reserva.fecha == result.fecha &&
        reserva.porcentajeLluvia == result.porcentajeLluvia &&
        reserva.cancha.nombre == result.cancha.nombre);

    expect(success, isTrue);
  });
}
