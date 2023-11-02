import 'package:flutter/widgets.dart';
import 'package:localizations/localizations.dart';
import 'package:ui_kit/ui_kit.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorScheme = AppColorScheme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return ColoredBox(
      color: AppColorScheme.of(context).background,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CustomAppBar(automaticallyImplyLeading: true),
            Expanded(
              child: Center(
                child: Text(
                  l10n.failure,
                  style: textTheme.body.copyWith(color: colorScheme.error),
                ),
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
