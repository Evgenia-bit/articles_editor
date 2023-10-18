import 'package:api/api.dart';
import 'package:artus/features/article/domain/use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mapper/mapper.dart';

class ArticleRepository implements GetArticleUseCase {

  ArticleRepository({
    required int articleId,

  }) {
    final modelsList = mapper.getWidgetsFromJson(json, context)
    widgetsList = 
  }

  @override
  List<Block> widgetsList;
}
