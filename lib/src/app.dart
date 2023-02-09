import 'dart:ui';

// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tenis/src/presentation/pages/canchaDetalle/cancha_detalle.dart';
import 'package:tenis/src/presentation/pages/home.dart';
import 'package:tenis/src/presentation/pages/nueva_reservacion/nueva_reservacion.dart';
import 'package:tenis/src/provider/reservacion_prov.dart';
import 'package:tenis/src/utils/app_config.dart';
import 'package:tenis/src/utils/dialog_helper.dart';

import 'domain/domain.dart';
import 'domain/domains.dart';
import 'presentation/widgets/widgets.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ReservacionProvider(),
          )
        ],
        child: MaterialApp(
          locale: window.locale,
          // navigatorKey: RoutesApp.navigatorKey,
          debugShowCheckedModeBanner: AppConfig.isDebug,
          title: 'Tenis APP',
          theme: AppTheme.theme,
          localizationsDelegates: const [
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
          ],
          scaffoldMessengerKey: DialogHelper.key,

          initialRoute: '/',
          routes: {
            '/': (context) => const Home(),
            CanchaDetalle.path: (context) => const CanchaDetalle(),
            NuevaReservacion.path: (context) => const NuevaReservacion(),
          },
        ),
      ),
    );
  }
}
