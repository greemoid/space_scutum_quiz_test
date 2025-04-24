import 'package:fpdart/fpdart.dart';
import 'package:space_scutum_quiz_test/core/errors/failure.dart';
import 'package:space_scutum_quiz_test/domain/entities/result.dart';
import 'package:space_scutum_quiz_test/domain/repositories/quiz_repository.dart';

class AddResultUsecase {
  final QuizRepository _quizRepository;

  AddResultUsecase({required QuizRepository quizRepository})
      : _quizRepository = quizRepository;

  Either<Failure, int> call(Result result) => _quizRepository.addResult(result);
}
