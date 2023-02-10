import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tenis/src/app.dart';
import 'package:tenis/src/utils/app_config.dart';

import 'src/infraestructure/dependencies.dart';
import 'src/presentation/widgets/widgets.dart';
import 'src/utils/utils.dart';
import 'package:hive/hive.dart';

void main() async {
  AppConfig.init(
    isDebug: true,
    urlApp: 'https://api.weatherapi.com/v1/',
    // urlApp: 'https://api.openweathermap.org/data/2.5/weather',

    version: '1.1',
  );

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  );
  // import tex
  ErrorWidget.builder = RootWidget.onError;

  SystemChrome.setPreferredOrientations(
    const [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );

  await dotenv.load(fileName: ".env");
  await Dependencies.init(Hive);

  runApp(const App());
}
