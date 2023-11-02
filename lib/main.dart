import 'package:artus/features/app/app.dart';
import 'package:artus/features/app/di/app_assembly.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

void main() async {
  final appAssembly = AppAssembly();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    appAssembly.logger.log(details);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    appAssembly.logger.log(error);
    return true;
  };

  runApp(MyApp(appAssembly: appAssembly));
}
