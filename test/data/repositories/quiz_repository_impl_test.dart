import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_scutum_quiz_test/core/errors/failure.dart';
import 'package:space_scutum_quiz_test/data/datasources/quiz_local_data_source.dart';
import 'package:space_scutum_quiz_test/data/datasources/quiz_network_data_source.dart';
import 'package:space_scutum_quiz_test/data/models/result_model.dart';
import 'package:space_scutum_quiz_test/data/repositories/quiz_repository_impl.dart';

import '../utils/mock_models.dart';

class MockQuizNetworkDataSource extends Mock implements QuizNetworkDataSource {}

class MockQuizLocalDataSource extends Mock implements QuizLocalDataSource {}

class MockResultModel extends Fake implements ResultModel {}

void main() {
  late QuizRepositoryImpl repository;
  late MockQuizNetworkDataSource mockNetwork;
  late MockQuizLocalDataSource mockLocal;

  setUp(() {
    mockNetwork = MockQuizNetworkDataSource();
    mockLocal = MockQuizLocalDataSource();
    repository = QuizRepositoryImpl(
      quizNetworkDataSource: mockNetwork,
      quizLocalDataSource: mockLocal,
    );
  });

  setUpAll(() {
    registerFallbackValue(MockResultModel());
  });

  group('getQuiz', () {
    test('should return Quiz on success', () async {
      when(() => mockNetwork.getQuiz()).thenAnswer((_) async => mockQuizModel);

      final result = await repository.getQuiz();

      expect(result.isRight(), true);
      expect(result.getRight().toNullable(), equals(mockQuiz));
    });

    test('should return NetworkFailure on error', () async {
      when(() => mockNetwork.getQuiz())
          .thenThrow(NetworkFailure('no internet', StackTrace.empty));

      final result = await repository.getQuiz();

      expect(result.isLeft(), true);
      expect(result.getLeft().toNullable(), isA<NetworkFailure>());
    });
  });

  group('addResult', () {
    test('should return id when result added successfully', () {
      when(() => mockLocal.addResult(any())).thenReturn(42);

      final result = repository.addResult(mockResult);

      expect(result.isRight(), true);
      expect(result.getRight().toNullable(), 42);
    });

    test('should return CacheFailure when error occurs', () {
      when(() => mockLocal.addResult(any())).thenThrow(Exception("DB error"));

      final result = repository.addResult(mockResult);

      expect(result.isLeft(), true);
      expect(result.getLeft().toNullable(), isA<CacheFailure>());
    });
  });

  group('getResults', () {
    test('should return list of results', () {
      when(() => mockLocal.getResult()).thenReturn([mockResultModel]);

      final result = repository.getResults();

      expect(result.isRight(), true);
      expect(result.getRight().toNullable(), [mockResult]);
    });

    test('should return CacheFailure when exception occurs', () {
      when(() => mockLocal.getResult()).thenThrow(Exception("Read error"));

      final result = repository.getResults();

      expect(result.isLeft(), true);
      expect(result.getLeft().toNullable(), isA<CacheFailure>());
    });
  });
}
