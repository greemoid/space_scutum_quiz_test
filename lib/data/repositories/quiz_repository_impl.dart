import 'package:fpdart/src/either.dart';
import 'package:space_scutum_quiz_test/core/errors/failure.dart';
import 'package:space_scutum_quiz_test/data/datasources/quiz_network_data_source.dart';
import 'package:space_scutum_quiz_test/data/mappers/quiz_mapper.dart';
import 'package:space_scutum_quiz_test/domain/entities/quiz.dart';
import 'package:space_scutum_quiz_test/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizNetworkDataSource quizNetworkDataSource;

  QuizRepositoryImpl({required this.quizNetworkDataSource});

  @override
  Future<Either<Failure, Quiz>> getQuiz() async {
    try {
      final result = await quizNetworkDataSource.getQuiz();

      return Either.right(result.toDomain());
    } on NetworkFailure catch (e) {
      return Either.left(NetworkFailure(e.message, e.stackTrace));
    }
  }
}
