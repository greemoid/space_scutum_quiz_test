import 'package:fpdart/src/either.dart';
import 'package:space_scutum_quiz_test/core/errors/failure.dart';
import 'package:space_scutum_quiz_test/data/datasources/quiz_local_data_source.dart';
import 'package:space_scutum_quiz_test/data/datasources/quiz_network_data_source.dart';
import 'package:space_scutum_quiz_test/data/mappers/quiz_mapper.dart';
import 'package:space_scutum_quiz_test/data/mappers/result_mapper.dart';
import 'package:space_scutum_quiz_test/domain/entities/quiz.dart';
import 'package:space_scutum_quiz_test/domain/entities/result.dart';
import 'package:space_scutum_quiz_test/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizNetworkDataSource _quizNetworkDataSource;
  final QuizLocalDataSource _quizLocalDataSource;

  QuizRepositoryImpl(
      {required QuizNetworkDataSource quizNetworkDataSource,
      required QuizLocalDataSource quizLocalDataSource})
      : _quizNetworkDataSource = quizNetworkDataSource,
        _quizLocalDataSource = quizLocalDataSource;

  @override
  Future<Either<Failure, Quiz>> getQuiz() async {
    try {
      final result = await _quizNetworkDataSource.getQuiz();

      return Either.right(result.toDomain());
    } on NetworkFailure catch (e) {
      return Either.left(NetworkFailure(e.message, e.stackTrace));
    }
  }

  @override
  Either<Failure, int> addResult(Result result) {
    try {
      final id = _quizLocalDataSource.addResult(result.toData());
      return Either.right(id);
    } catch (e) {
      return Either.left(CacheFailure(e.toString()));
    }
  }

  @override
  Either<Failure, List<Result>> getResults() {
    try {
      final result = _quizLocalDataSource.getResult();
      return Either.right(result.map((data) => data.toDomain()).toList());
    } catch (e) {
      return Either.left(CacheFailure(e.toString()));
    }
  }
}
