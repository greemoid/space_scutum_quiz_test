import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_scutum_quiz_test/core/errors/failure.dart';
import 'package:space_scutum_quiz_test/domain/entities/result.dart';
import 'package:space_scutum_quiz_test/domain/usecases/add_result_usecase.dart';
import 'package:space_scutum_quiz_test/domain/usecases/get_result_usecase.dart';
import 'package:space_scutum_quiz_test/presentation/blocs/history/result_bloc.dart';

class MockGetResultUsecase extends Mock implements GetResultUsecase {}

class MockAddResultUsecase extends Mock implements AddResultUsecase {}

void main() {
  late ResultBloc resultBloc;
  late GetResultUsecase mockGetResultUsecase;
  late AddResultUsecase mockAddResultUsecase;

  setUp(() {
    mockGetResultUsecase = MockGetResultUsecase();
    mockAddResultUsecase = MockAddResultUsecase();
    resultBloc = ResultBloc(
      getResultUsecase: mockGetResultUsecase,
      addResultUsecase: mockAddResultUsecase,
    );
  });

  setUpAll(() {
    registerFallbackValue(Result(
        totalQuestions: 10,
        correctAnswers: 6,
        createdAtUtc: DateTime.utc(2025, 4, 25)));
  });

  tearDown(() {
    resultBloc.close();
  });

  group('ResultBloc', () {
    final testResult = Result(
      id: 1,
      totalQuestions: 10,
      correctAnswers: 8,
      createdAtUtc: DateTime.utc(2025, 4, 25),
    );
    final testResultsList = [testResult];

    test('initial state is ResultInitial', () {
      expect(resultBloc.state, equals(ResultInitial()));
    });

    blocTest<ResultBloc, ResultState>(
      'emits [ResultLoading, ResultLoaded] when GetResultEvent is successful',
      build: () {
        when(() => mockGetResultUsecase())
            .thenAnswer((_) => Right(testResultsList));
        return resultBloc;
      },
      act: (bloc) => bloc.add(GetResultEvent()),
      expect: () => [ResultLoading(), ResultLoaded(result: testResultsList)],
    );

    blocTest<ResultBloc, ResultState>(
      'emits [ResultLoading, ResultError] when GetResultEvent fails',
      build: () {
        when(() => mockGetResultUsecase())
            .thenAnswer((_) => Left(NetworkFailure('Network Error')));
        return resultBloc;
      },
      act: (bloc) => bloc.add(GetResultEvent()),
      expect: () => [ResultLoading(), ResultError(message: 'Network Error')],
    );

    blocTest<ResultBloc, ResultState>(
      'emits [ResultLoading, ResultAdded] when AddResultEvent is successful',
      build: () {
        when(() => mockAddResultUsecase(any()))
            .thenAnswer((_) => Right(testResult.id!));
        return resultBloc;
      },
      act: (bloc) => bloc.add(AddResultEvent(result: testResult)),
      expect: () => [ResultLoading(), ResultAdded(id: testResult.id!)],
    );

    blocTest<ResultBloc, ResultState>(
      'emits [ResultLoading, ResultError] when AddResultEvent fails',
      build: () {
        when(() => mockAddResultUsecase(any()))
            .thenAnswer((_) => Left(NetworkFailure('Network Error')));
        return resultBloc;
      },
      act: (bloc) => bloc.add(AddResultEvent(result: testResult)),
      expect: () => [ResultLoading(), ResultError(message: 'Network Error')],
    );
  });
}
