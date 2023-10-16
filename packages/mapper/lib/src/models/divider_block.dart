import 'package:flutter/widgets.dart';
import 'package:mapper/src/models/block.dart';

class DividerBlock extends Block {
  DividerBlock();
  @override
  Widget get widget => const SizedBox(
        width: double.infinity,
        height: 1,
        child: ColoredBox(color: Color(0xFF000000)),
      );
}
