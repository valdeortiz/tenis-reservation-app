import '../domain.dart';

abstract class ReservacionDomain extends Domain {
  final ReservacionRepository repository;
  ReservacionDomain(this.repository);
  Future<List<Reservacion>> getList([int skip, int limit]);
  List<Reservacion> getReservas();
  List<Reservacion> getReservasFechas(DateTime date);

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
  List<Reservacion> getReservas() {
    return repository.getReservas();
  }

  @override
  List<Reservacion> getReservasFechas(DateTime date) {
    return repository.getReservasFechas(date);
  }

  @override
  void saveReserva(Reservacion reservacion) =>
      repository.saveReserva(reservacion);

  @override
  void deleteReserva(Reservacion reservacion) =>
      repository.deleteReserva(reservacion);
}
