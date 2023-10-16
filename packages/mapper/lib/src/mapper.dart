import 'package:flutter/widgets.dart';
import 'package:mapper/src/models/block.dart';
import 'package:mapper/src/models/divider_block.dart';
import 'package:mapper/src/models/list_block.dart';
import 'package:mapper/src/models/paragraph_block.dart';
import 'package:mapper/src/models/quote_block.dart';
import 'package:mapper/src/models/video_block.dart';

class Mapper {
  List<Widget> getWidgetList(Map<String, dynamic> json) {
    if (json['blocks'] is! List) return [];

    return (json['blocks'] as List).map((json) {
      if (json is! Map<String, dynamic>) return const SizedBox.shrink();

      final block = typeMap[json['type'] as String]
          ?.call(json['data'] as Map<String, dynamic>);

      return block?.widget ?? const SizedBox.shrink();
    }).toList();
  }
}

final Map<String, Block Function(Map<String, dynamic>)> typeMap = {
  'paragraph': ParagraphBlock.fromJson,
  'quote': QuoteBlock.fromJson,
  'divider': (json) => DividerBlock(),
  'video': VideoBlock.fromJson,
  'list': ListBlock.fromJson,
};
