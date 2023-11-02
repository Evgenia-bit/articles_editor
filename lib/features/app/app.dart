import 'package:artus/features/app/di/app_assembly.dart';
import 'package:artus/features/article/di/entry.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:ui_kit/ui_kit.dart';

class MyApp extends StatelessWidget {
  final AppAssembly appAssembly;
  const MyApp({required this.appAssembly, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      home: ArticleEntry(
        appAssembly: appAssembly,
        articleId: 1,
      ),
    );
  }
}
