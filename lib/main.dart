import 'package:artus/features/example/data/repository.dart';
import 'package:artus/features/example/presentation/widget_component.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:ui_kit/ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final repository = CounterRepository(counter: 0);

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Counter',
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      home: CounterWidgetComponent(
        decrementCounterUseCase: repository,
        incrementCounterUseCase: repository,
        getCounterUseCase: repository,
      ),
    );
  }
}
