import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get increment => 'Увеличить';

  @override
  String get decrement => 'Уменьшить';

  @override
  String get text => 'Вы нажимали на кнопку столько раз:';
}
