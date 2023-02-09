import 'package:tenis/src/models/reservacion.dart';

import '../domain.dart';

abstract class ReservacionDomain extends Domain {
  final ReservacionRepository repository;
  ReservacionDomain(this.repository);
  Future<List<Reservacion>> getList([int skip, int limit]);
  Future<List<Reservacion>> getReservas();

  void saveReserva(Reservacion reservacion);
  void deleteReserva(Reservacion reservacion);
}

class ReservacionDomainImpl extends ReservacionDomain {
  ReservacionDomainImpl(ReservacionRepository repository) : super(repository);
  @override
  void init() {}

  @override
  Future<List<Reservacion>> getList([int skip = 0, limit = 10]) async {
    final response = await repository.getList(skip, limit);
    if (response.isNotError) {
      return response.data!;
    }
    showError(response);
    return [];
  }

  @override
  Future<List<Reservacion>> getReservas() async {
    return repository.getReservas();
  }

  @override
  void saveReserva(Reservacion reservacion) =>
      repository.saveReserva(reservacion);

  @override
  void deleteReserva(Reservacion reservacion) =>
      repository.deleteReserva(reservacion);
}
