import 'package:artus/features/app/app.dart';
import 'package:artus/features/app/di/app_accembly.dart';
import 'package:flutter/widgets.dart';

void main() {
  final appAssembly = AppAssembly();
  runApp(MyApp(appAssembly: appAssembly));
}
