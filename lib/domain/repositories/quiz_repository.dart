import 'package:fpdart/fpdart.dart';
import 'package:space_scutum_quiz_test/core/errors/failure.dart';
import 'package:space_scutum_quiz_test/domain/entities/quiz.dart';
import 'package:space_scutum_quiz_test/domain/entities/result.dart';

abstract interface class QuizRepository {
  Future<Either<Failure, Quiz>> getQuiz();

  Either<Failure, List<Result>> getResults();

  Either<Failure, int> addResult(Result result);
}
