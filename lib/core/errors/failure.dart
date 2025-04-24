
abstract class Failure {
  final String message;
  final StackTrace? stackTrace;

  Failure(this.message, [this.stackTrace]);

  @override
  String toString() => '$runtimeType: $message';
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message, [super.stackTrace]);
}

class CacheFailure extends Failure {
  CacheFailure(super.message, [super.stackTrace]);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure(super.message, [super.stackTrace]);
}
