import 'package:artus/features/article/presentation/widget_component.dart';
import 'package:artus/features/article_list/data/article_list_repository.dart';
import 'package:artus/features/article_list/presentation/widget_component.dart';
import 'package:artus/router.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {



    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Artus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
  
    );
  }
}
