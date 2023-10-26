import 'package:flutter/widgets.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/heading_block_model.dart';
import 'package:ui_kit/ui_kit.dart';

class HeadingBlock extends Block<HeadingBlockModel> {
  HeadingBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final color = AppColorScheme.of(context).onBackground;

    return Text(
      model.text,
      textAlign: TextAlign.center,
      style: switch (model.level) {
        1 => textTheme.headlineLarge.copyWith(color: color),
        2 => textTheme.headlineMedium.copyWith(color: color),
        _ => textTheme.headlineSmall.copyWith(color: color),
      },
    );
  }
}
