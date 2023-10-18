import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/utils/safe_cast.dart';

abstract class VideoBlockModel extends BlockModel {
  abstract final String? url;
}

class CustomVideoBlockModel extends VideoBlockModel {
  @override
  final String? url;

  CustomVideoBlockModel.fromJson(Map<String, dynamic>? json)
      : url = safeCast<String>(json?['url']);
}
