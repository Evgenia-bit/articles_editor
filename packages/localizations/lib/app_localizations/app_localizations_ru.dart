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

  @override
  String get failure => 'Ошибка';

  @override
  String get failureUnknown => 'Произошла неизвестная ошибка';

  @override
  String get failureInvalidTitle => 'Некорректный заголовок';

  @override
  String get failureArticleNotFound => 'Статья не найдена';
}
