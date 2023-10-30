import 'package:artus/features/article/data/models/article.dart';

abstract class ArticleComponent {
  ArticleState get articleState;
}

sealed class ArticleState {}

class ArticleStateData extends ArticleState {
  final Article article;
  final String? warningMessage;

  ArticleStateData({
    required this.article,
    this.warningMessage,
  });
}

class ArticleStateLoading extends ArticleState {}

class ArticleStateFailure extends ArticleState {
  final String? errorMessage;
  ArticleStateFailure([this.errorMessage]);
}
