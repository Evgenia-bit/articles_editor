import 'package:flutter/widgets.dart';
import 'package:mapper/src/models/block_model.dart';

class Block<T extends BlockModel> {
  final T model;
  Block(this.model);
  Widget buildWidget() => SizedBox.fromSize();
}


