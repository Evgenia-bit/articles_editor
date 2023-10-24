import 'package:flutter/widgets.dart';
import 'package:mapper/src/models/block_model.dart';

abstract class Block<T extends BlockModel> {
  final T model;

  const Block(this.model);

  Widget buildWidget(BuildContext context);
}
