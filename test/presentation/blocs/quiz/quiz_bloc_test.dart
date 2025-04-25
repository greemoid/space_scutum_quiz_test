import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_scutum_quiz_test/core/errors/failure.dart';
import 'package:space_scutum_quiz_test/domain/entities/quiz.dart';
import 'package:space_scutum_quiz_test/domain/usecases/get_quiz_usecase.dart';
import 'package:space_scutum_quiz_test/presentation/blocs/quiz/quiz_bloc.dart';

class MockGetQuizUsecase extends Mock implements GetQuizUsecase {}

void main() {
  late QuizBloc quizBloc;
  late GetQuizUsecase mockGetQuizUsecase;

  setUp(() {
    mockGetQuizUsecase = MockGetQuizUsecase();
    quizBloc = QuizBloc(getQuizUsecase: mockGetQuizUsecase);
  });

  tearDown(() {
    quizBloc.close();
  });

  group('QuizBloc', () {
    final testQuiz = Quiz(questions: [], id: 1);

    test('initial state is QuizInitial', () {
      expect(quizBloc.state, equals(QuizInitial()));
    });

    blocTest<QuizBloc, QuizState>(
      'emits [QuizLoading, QuizLoaded] when GetQuizEvent is successful',
      build: () {
        // Make sure the mock returns a Future<Either<Failure, Quiz>>.
        when(() => mockGetQuizUsecase())
            .thenAnswer((_) async => Right(testQuiz));
        return quizBloc;
      },
      act: (bloc) => bloc.add(GetQuizEvent()),
      expect: () => [QuizLoading(), QuizLoaded(quiz: testQuiz)],
    );

    blocTest<QuizBloc, QuizState>(
      'emits [QuizLoading, QuizError] when GetQuizEvent fails',
      build: () {
        // Make sure the mock returns a Future<Either<Failure, Quiz>>.
        when(() => mockGetQuizUsecase())
            .thenAnswer((_) async => Left(NetworkFailure('Network Error')));
        return quizBloc;
      },
      act: (bloc) => bloc.add(GetQuizEvent()),
      expect: () => [QuizLoading(), QuizError(message: 'Network Error')],
    );
  });
}
