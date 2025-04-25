import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:objectbox/objectbox.dart';
import 'package:space_scutum_quiz_test/data/datasources/quiz_local_data_source.dart';
import 'package:space_scutum_quiz_test/data/models/result_model.dart';

class MockBox extends Mock implements Box<ResultModel> {}

void main() {
  late QuizLocalDataSourceImpl localDataSource;
  late MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
    localDataSource = QuizLocalDataSourceImpl(box: mockBox);
  });

  group('addResult', () {
    test('should return id when result is added', () {
      final result = ResultModel(
        totalQuestions: 10,
        correctAnswers: 7,
        createdAtUtc: DateTime.now().toUtc(),
      );
      when(() => mockBox.put(result)).thenReturn(1);

      final id = localDataSource.addResult(result);

      expect(id, 1);
      verify(() => mockBox.put(result)).called(1);
    });
  });

  group('getResult', () {
    test('should return list of ResultModel', () {
      final results = [
        ResultModel(
            id: 1,
            totalQuestions: 10,
            correctAnswers: 7,
            createdAtUtc: DateTime.now().toUtc()),
        ResultModel(
            id: 2,
            totalQuestions: 5,
            correctAnswers: 4,
            createdAtUtc: DateTime.now().toUtc()),
      ];
      when(() => mockBox.getAll()).thenReturn(results);

      final result = localDataSource.getResult();

      expect(result, results);
      verify(() => mockBox.getAll()).called(1);
    });

    test('should return empty list when no results', () {
      when(() => mockBox.getAll()).thenReturn([]);

      final result = localDataSource.getResult();

      expect(result, isEmpty);
      verify(() => mockBox.getAll()).called(1);
    });
  });
}
