import 'package:artus/features/app/app.dart';
import 'package:artus/features/app/di/app_assembly.dart';
import 'package:flutter/widgets.dart';

void main() {
  final appAssembly = AppAssembly();
  runApp(MyApp(appAssembly: appAssembly));
}
