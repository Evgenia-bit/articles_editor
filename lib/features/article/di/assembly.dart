import 'package:artus/features/article/domain/use_case.dart';
import 'package:core/core.dart';

abstract interface class IArticleAssembly {
  LoadArticleUseCase get loadArticleUseCase;
  FailureDisplayer get failureDisplayer;
}
