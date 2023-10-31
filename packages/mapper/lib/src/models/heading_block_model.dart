import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/utils/safe_cast.dart';

abstract class HeadingBlockModel extends BlockModel {
  abstract final String text;
  abstract final int level;
}

class CustomHeadingBlockModel extends HeadingBlockModel {
  @override
  final int level;

  @override
  final String text;

  CustomHeadingBlockModel({required this.level, required this.text});

  ///If the header level parsing fails, the largest one is set by default.
  CustomHeadingBlockModel.fromJson(Map<String, dynamic>? json)
      : level = safeCast<int>(json?['level']) ?? 1,
        text = json?['text'] as String;
}
