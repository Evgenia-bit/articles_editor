import 'package:artus/features/article/domain/models/article.dart';
import 'package:core/core.dart';

sealed class ArticleState {}

class ArticleStateData extends ArticleState {
  final Article article;
  final Failure? failure;

  ArticleStateData({
    required this.article,
    this.failure,
  });
}

class ArticleStateLoading extends ArticleState {}

class ArticleStateFailure extends ArticleState {
  final Exception failure;
  ArticleStateFailure(this.failure);
}
