import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tenis/src/domain/domains.dart';

final getIt = GetIt.instance;

mixin Dependencies {
  static Future<void> init(HiveInterface interface) async {
    getIt.registerSingleton<ReservacionDomain>(
      ReservacionDomainImpl(ReservacionRepositoryImpl(interface)),
    );

    return await handleHive(interface);
  }

  static Future<void> handleHive(HiveInterface interface) async {
    await interface.initFlutter();
    interface.registerAdapter<Reservacion>(ReservacionAdapter());
    interface.registerAdapter<Cancha>(CanchaAdapter());
    await interface.openBox('reservas');
    Future<void> open() async {
      try {
        await interface.openBox('settings');
      } on Exception {
        await interface.deleteBoxFromDisk('settings');
        return await open();

        // ignore: avoid_catching_errors
      } on HiveError {
        await interface.deleteBoxFromDisk('settings');
        return await open();
      }
      return;
    }

    await open();
    GetIt.instance.registerSingleton<ApiRepository>(ApiRepository(null));
    // Get.put<ApiRepository>(ApiRepository(), permanent: true);

    return;
  }
}
