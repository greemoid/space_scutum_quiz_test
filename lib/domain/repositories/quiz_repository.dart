import 'package:fpdart/fpdart.dart';
import 'package:space_scutum_quiz_test/core/errors/failure.dart';
import 'package:space_scutum_quiz_test/domain/entities/quiz.dart';

abstract interface class QuizRepository {
  Future<Either<Failure, Quiz>> getQuiz();
}
