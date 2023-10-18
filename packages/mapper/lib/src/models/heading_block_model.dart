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

  CustomHeadingBlockModel.fromJson(Map<String, dynamic>? json)
      : level = safeCast<int>(json?['level']) ?? 1,
        text = safeCast<String>(json?['text']) ?? '';
}
