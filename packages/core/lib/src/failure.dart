class Failure implements Exception {
  final String? message;
  final StackTrace? stackTrace;
  Failure([this.message, this.stackTrace]);
}

class ArticleNotFoundFailure extends Failure {
  ArticleNotFoundFailure();
}

class InvalidTitle extends Failure {
  InvalidTitle();
}
