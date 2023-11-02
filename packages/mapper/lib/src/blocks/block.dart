import 'package:flutter/widgets.dart';
import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/utils/export_to_html.dart';

abstract class Block<T extends BlockModel> {
  final T model;
  const Block(this.model);

  Widget buildWidget(BuildContext context);
  String accept(Visitor visitor);
}
