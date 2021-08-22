import 'package:flutter/cupertino.dart';
import 'package:ralle_e/src/core/env/env.dart';
import 'package:ralle_e/src/features/app/presentation/app.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  sl.registerLazySingleton(() => Env(EnvMode.local));
  runApp(App());
}