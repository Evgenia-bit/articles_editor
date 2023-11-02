import 'package:artus/features/article_list/domain/use_case.dart';
import 'package:core/core.dart';

abstract interface class IArticleListAssembly {
  IncrementCurrentPageUseCase get incrementCurrentPageUseCase;
  LoadArticleListUseCase get loadArticleListUseCase;
  GetArticlesCountUseCase get getArticlesCountUseCase;
  FailureDisplayer get failureDisplayer;
}
