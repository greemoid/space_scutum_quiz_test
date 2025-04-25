import 'package:flutter_test/flutter_test.dart';
import 'package:space_scutum_quiz_test/data/datasources/quiz_network_data_source.dart';
import 'package:space_scutum_quiz_test/data/models/quiz_model.dart';

import '../utils/mock_asset_bundle.dart';

void main() {
  late QuizNetworkDataSourceImpl quizNetworkDataSource;
  late MockAssetBundle mockAssetBundle;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    mockAssetBundle = MockAssetBundle();
    quizNetworkDataSource =
        QuizNetworkDataSourceImpl(rootBundle: mockAssetBundle);
  });

  test('getQuiz should return a QuizModel with correct data', () async {
    final mockJson = '''
    {
      "id": 1,
      "questions": [
        {
          "id": 1,
          "question": "What is the longest river in the world?",
          "answers": [
            {"id": 1, "answer": "Amazon River"},
            {"id": 2, "answer": "Nile River"},
            {"id": 3, "answer": "Yangtze River"},
            {"id": 4, "answer": "Mississippi River"}
          ],
          "correctAnswerId": 2
        }
      ]
    }
    ''';
    mockAssetBundle.setMockData('assets/quiz.json', mockJson);

    final result = await quizNetworkDataSource.getQuiz();

    expect(result, isA<QuizModel>());
    expect(result.id, 1);
    expect(result.questions.length, 1);
    expect(result.questions.first.id, 1);
    expect(result.questions.first.question,
        "What is the longest river in the world?");
    expect(result.questions.first.answers.length, 4);
    expect(result.questions.first.correctAnswerId, 2);
  });

  test('getQuiz should parse complete quiz data correctly', () async {
    final mockJson = '''
    {
      "id": 1,
      "questions": [
        {
          "id": 1,
          "question": "What is the longest river in the world?",
          "answers": [
            {"id": 1, "answer": "Amazon River"},
            {"id": 2, "answer": "Nile River"},
            {"id": 3, "answer": "Yangtze River"},
            {"id": 4, "answer": "Mississippi River"}
          ],
          "correctAnswerId": 2
        },
        {
          "id": 2,
          "question": "Which country has the most natural lakes?",
          "answers": [
            {"id": 1, "answer": "United States"},
            {"id": 2, "answer": "Russia"},
            {"id": 3, "answer": "Canada"},
            {"id": 4, "answer": "India"}
          ],
          "correctAnswerId": 3
        }
      ]
    }
    ''';
    mockAssetBundle.setMockData('assets/quiz.json', mockJson);

    final result = await quizNetworkDataSource.getQuiz();

    expect(result.questions.length, 2);
    expect(result.questions[1].id, 2);
    expect(result.questions[1].answers[2].answer, "Canada");
    expect(result.questions[1].correctAnswerId, 3);
  });

  test('getQuiz should throw when JSON is invalid', () async {
    final mockJson = 'invalid json';
    mockAssetBundle.setMockData('assets/quiz.json', mockJson);

    expect(() async => await quizNetworkDataSource.getQuiz(),
        throwsA(isA<FormatException>()));
  });

  test('getQuiz should throw when asset is not found', () async {
    mockAssetBundle.throwOnLoadString = true;

    expect(() async => await quizNetworkDataSource.getQuiz(),
        throwsA(isA<Exception>()));
  });
}
