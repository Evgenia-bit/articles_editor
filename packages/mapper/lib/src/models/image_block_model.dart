import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/utils/safe_cast.dart';

abstract class ImageBlockModel extends BlockModel {
  abstract final String? url;
}

class CustomImageBlockModel extends ImageBlockModel {
  @override
  final String? url;

  CustomImageBlockModel.fromJson(Map<String, dynamic>? json)
      : url =  safeCast<String>(json?['url']);
}
