import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:localizations/localizations.dart';

abstract class FailureDisplayer {
  final MessageController messageController;

  FailureDisplayer(this.messageController);

  Future<void> display(BuildContext context, Object failure) async {
    final l10n = AppLocalizations.of(context)!;

    if (failure is Failure) {
      return displayFailure(context, failure);
    }

    await messageController.show(context, l10n.failureUnknown);
  }

  Future<void> displayFailure(BuildContext context, Failure failure);
}
