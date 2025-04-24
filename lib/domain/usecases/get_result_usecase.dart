import 'package:fpdart/fpdart.dart';
import 'package:space_scutum_quiz_test/core/errors/failure.dart';
import 'package:space_scutum_quiz_test/domain/entities/result.dart';
import 'package:space_scutum_quiz_test/domain/repositories/quiz_repository.dart';

class GetResultUsecase {
  final QuizRepository _quizRepository;

  GetResultUsecase({required QuizRepository quizRepository})
      : _quizRepository = quizRepository;

  Either<Failure, List<Result>> call() => _quizRepository.getResults();
}
