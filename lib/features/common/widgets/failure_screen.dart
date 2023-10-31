import 'package:flutter/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

class FailureScreen extends StatelessWidget {
  final String text;
  const FailureScreen({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColorScheme.of(context).background,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CustomAppBar(
              title: '',
              automaticallyImplyLeading: true,
            ),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: AppTextTheme.of(context).body.copyWith(
                        color: AppColorScheme.of(context).error,
                      ),
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
