import 'package:tenis/src/provider/reservacion_prov.dart';
import 'package:test/test.dart';

void main() {
  test("Numero de reservas por dia", () {
    expect(ReservacionProvider.nroReservasMaximas, 3);
  });
}
