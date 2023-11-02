import 'package:flutter/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

class MessageController {
  Future<void> show(BuildContext context, String content) async {
    final entry = OverlayEntry(
      builder: (context) {
        return CustomSnackBar(text: content);
      },
    );
    Overlay.of(context).insert(entry);
    await Future.delayed(const Duration(seconds: 5));
    entry.remove();
  }
}
