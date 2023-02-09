import 'package:hive/hive.dart';
import 'package:tenis/src/infraestructure/hive_repository.dart';
import 'package:tenis/src/models/reservacion.dart';

import '../../infraestructure/api_response.dart';

import '../repository.dart';

abstract class ReservacionRepository extends Repository {
  ReservacionRepository(HiveInterface hiveInterface) : super(hiveInterface);

  Future<ApiResponse<List<Reservacion>>> getList([int skip, int limit]);
  List<Reservacion> getReservas();
  List<Reservacion> getReservasFechas(DateTime date);
  // Future<ApiResponse<double>> getProbabilidadLluvia(double lat, double long);
  Future<dynamic> getProbabilidadLluvia(double lat, double long);

  void saveReserva(Reservacion reservacion);
  void deleteReserva(Reservacion reservacion);
}

class ReservacionRepositoryImpl extends ReservacionRepository {
  ReservacionRepositoryImpl(HiveInterface hiveInterface)
      : super(hiveInterface) {
    ApiResponse.register<Reservacion>(Reservacion.fromJson);
  }

  @override
  Future<ApiResponse<List<Reservacion>>> getList(
      [int skip = 0, int limit = 10]) async {
    final response = await dio.get('/reservaciones', queryParameters: {
      if (skip > 0) 'skip': skip,
      'limit': limit,
    });
    final result =
        ApiResponse.fromList<Reservacion>(response, (a) => a['reservaciones']);
    return result;
  }

  @override
  List<Reservacion> getReservas() {
    final hive = HiveRepository(hiveInterface);
    final reservas = hive.getList('reservas');
    return List<Reservacion>.from(reservas);
  }

  @override
  void saveReserva(Reservacion reservacion) {
    final hive = HiveRepository(hiveInterface);
    hive.put('reservas', reservacion.id.toString(), reservacion);
  }

  @override
  void deleteReserva(Reservacion reservacion) {
    final hive = HiveRepository(hiveInterface);
    hive.delete('reservas', reservacion.id.toString());
  }

  @override
  List<Reservacion> getReservasFechas(DateTime date) {
    return getReservas()
        .where((element) =>
            element.fecha.day == date.day &&
            element.fecha.month == date.month &&
            element.fecha.year == date.year)
        .toList();
  }

  @override
  Future<dynamic> getProbabilidadLluvia(double lat, double long) async {
    // final response = await dio.get('/api', queryParameters: {
    //   'key': '637f32b27d2f4f599aa211223230902',
    //   'lat': lat,
    //   'long;': long,
    // });
    // final result = ApiResponse.from(response);

    // // return result['current']['precip_mm'];
    // print(result);
    // // return result;
    // return 2.0;
  }
}
