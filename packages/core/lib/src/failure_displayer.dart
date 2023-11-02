import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:localizations/localizations.dart';

class FailureDisplayer {
  final MessageController _messageController;

  FailureDisplayer(MessageController messageController)
      : _messageController = messageController;

  Future<void> display(BuildContext context, Object failure) async {
    final l10n = AppLocalizations.of(context)!;

    if (failure is Failure) {
      return _displayFailure(context, failure);
    }

    await _messageController.show(context, l10n.failureUnknown);
  }

  Future<void> _displayFailure(BuildContext context, Failure failure) async {
    final message = failure.message;
    if (message != null) return _messageController.show(context, message);

    final l10n = AppLocalizations.of(context)!;

    if (failure is InvalidTitle) {
      return _messageController.show(context, l10n.failureInvalidTitle);
    }

    if (failure is ArticleNotFoundFailure) {
      return _messageController.show(context, l10n.failureArticleNotFound);
    }

    await _messageController.show(context, l10n.failureUnknown);
  }
}
