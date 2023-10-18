import 'package:mapper/src/models/block_model.dart';

abstract class HeadingBlockModel extends BlockModel {
  abstract final String text;
  abstract final int level;
}

class CustomHeadingBlockModel extends HeadingBlockModel {
  @override
  final int level;

  @override
  final String text;

  CustomHeadingBlockModel.fromJson(Map<String, dynamic> json)
      : level = json['level'] as int,
        text = json['text'] as String;
}
