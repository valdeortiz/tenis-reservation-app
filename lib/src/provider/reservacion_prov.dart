import 'package:tenis/src/domain/domains.dart';
import 'package:tenis/src/presentation/pages/home/constantes.dart';
import 'package:tenis/src/presentation/widgets/widgets.dart';
import 'package:tenis/src/utils/dialog_helper.dart';

enum CanchasDisponibles { A, B, C }

final tipoCanchas = {
  'A': Canchas.canchaCesped,
  'B': Canchas.canchaPiso,
  'C': Canchas.canchaTierra,
};

class ReservacionProvider extends ChangeNotifier {
  ReservacionProvider() {
    // getReservaciones();
    final data = domain.getReservas();
    reservas = data;
  }
  final domain = getIt.get<ReservacionDomain>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _dateInputController = TextEditingController();
  final TextEditingController _canchaController = TextEditingController();
  get nombreController => _nombreController;
  get dateInputController => _dateInputController;
  get canchaController => _canchaController;
  Cancha? _canchaSeleccionado;
  List<Reservacion> reservas = [];
  DateTime? fecha;
  double probabilidadLluvia = 0.0;
  String get probabilidadLluviaStr {
    return 'Probabilidad de lluvia: $probabilidadLluvia %';
  }

  String get datos {
    return "${_nombreController.text} - ${_dateInputController.text} - ${_canchaController.text}";
  }

  String get cancha => _canchaController.text;

  void setCancha(Cancha data) {
    _canchaController.text = data.nombre;
    _canchaSeleccionado = data;
    notifyListeners();
  }

  void setFecha(DateTime fecha) async {
    _dateInputController.text = fecha.stringFormat();
    this.fecha = fecha;
    final double data = await domain.getProbabilidadLluvia(fecha);
    print("Data: $data");
    probabilidadLluvia = data;
    notifyListeners();
  }

  void close() {
    probabilidadLluvia = 0.0;
    _nombreController.clear();
    _dateInputController.clear();
    _canchaController.clear();
    notifyListeners();
  }

  int nroReservas(fecha) {
    return domain.getReservasFechas(fecha!).length;
  }

  void getReservaciones() {
    final data = domain.getReservas();
    reservas = data;
    notifyListeners();
  }

  void eliminarReserva(Reservacion reservacion) {
    domain.deleteReserva(reservacion);
    getReservaciones();
  }

  reservar() {
    if (_nombreController.text.isNotEmpty &&
        _dateInputController.text.isNotEmpty &&
        _canchaController.text.isNotEmpty) {
      DialogHelper.showSuccess(datos);
      Cancha cancha = _canchaSeleccionado!;

      Reservacion reserva = Reservacion(
        id: fecha!.microsecondsSinceEpoch,
        fecha: fecha!,
        nombreUsuario: _nombreController.text,
        porcentajeLluvia: probabilidadLluvia,
        cancha: cancha,
      );
      domain.saveReserva(reserva);

      close();
      getReservaciones();
      return '';
    }
    String error = '';
    if (_nombreController.text.isEmpty) {
      error += 'Nombre vacio';
    }
    if (_dateInputController.text.isEmpty) {
      error += ' fecha vacio';
    }
    if (_canchaController.text.isEmpty) {
      error += ' cancha no seleccionado';
    }
    DialogHelper.showError(error);
  }
}
