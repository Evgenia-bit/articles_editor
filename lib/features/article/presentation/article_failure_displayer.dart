import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:localizations/app_localizations/app_localizations.dart';

class ArticleFailureDisolayer extends FailureDisplayer {
  ArticleFailureDisolayer(super.messageController);

  @override
  Future<void> displayFailure(BuildContext context, Failure failure) async {
    final message = failure.message;
    if (message != null) return messageController.show(context, message);

    final l10n = AppLocalizations.of(context)!;

    if (failure is InvalidTitle) {
      return messageController.show(context, l10n.failureInvalidTitle);
    }

    if (failure is ArticleNotFoundFailure) {
      return messageController.show(context, l10n.failureArticleNotFound);
    }

    await messageController.show(context, l10n.failureUnknown);
  }
}
