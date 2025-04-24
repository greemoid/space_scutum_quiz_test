import 'package:fpdart/fpdart.dart';
import 'package:space_scutum_quiz_test/core/errors/failure.dart';
import 'package:space_scutum_quiz_test/core/usecases/usecase_no_params.dart';
import 'package:space_scutum_quiz_test/domain/entities/quiz.dart';
import 'package:space_scutum_quiz_test/domain/repositories/quiz_repository.dart';

class GetQuizUsecase implements UsecaseNoParams<Either<Failure, Quiz>> {
  final QuizRepository _quizRepository;

  GetQuizUsecase({required QuizRepository quizRepository})
      : _quizRepository = quizRepository;

  @override
  Future<Either<Failure, Quiz>> call() async => await _quizRepository.getQuiz();
}
