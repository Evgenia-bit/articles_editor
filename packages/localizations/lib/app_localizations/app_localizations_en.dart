import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get increment => 'Increment';

  @override
  String get decrement => 'Decrement';

  @override
  String get text => 'You have pushed the button this many times:';

  @override
  String get readButtonText => 'Read';

  @override
  String get readButtonText => 'Read';

  @override
  String get failure => 'Error';

  @override
  String get failureUnknown => 'An unknown error has occurred';

  @override
  String get failureInvalidTitle => 'Incorrect title';

  @override
  String get failureArticleNotFound => 'Article not found';
}
