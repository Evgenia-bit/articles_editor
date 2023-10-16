import 'package:flutter/material.dart';
import 'package:mapper/src/models/block.dart';
import 'package:mapper/src/models/paragraph_block.dart';

class QuoteBlock extends Block {
  final Widget _paragraph;

  QuoteBlock.fromJson(Map<String, dynamic> json)
      : _paragraph = ParagraphBlock.fromJson(json).widget;

  @override
  Widget get widget => Row(
        children: [
          const SizedBox(
            width: 3,
            child: ColoredBox(color: Colors.black),
          ),
          _paragraph,
        ],
      );
}
