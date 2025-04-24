// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:space_scutum_quiz_test/data/datasources/quiz_network_data_source.dart';
// import 'package:space_scutum_quiz_test/data/models/quiz_model.dart';
//
// class MockDio extends Mock implements Dio {}
//
// void main() {
//   late MockDio dio;
//   late QuizNetworkDataSource dataSource;
//
//   setUp(() {
//     dio = MockDio();
//     dataSource = QuizNetworkDataSourceImpl(dio: dio);
//   });
//
//   test('getQuiz() should parse JSON from Dio response and return QuizModel', () async {
//     // arrange
//     final decodedMock = jsonDecode(mockResponse);
//     final extractedContent = decodedMock['choices'][0]['message']['content'] as String;
//     final quizMap = jsonDecode(extractedContent);
//
//     when(() => dio.post(
//       any(),
//       data: any(named: 'data'),
//       options: any(named: 'options'),
//     )).thenAnswer((_) async => Response(
//       data: decodedMock,
//       requestOptions: RequestOptions(path: ''),
//       statusCode: 200,
//     ));
//
//     // act
//     final result = await dataSource.getQuiz();
//
//     // assert
//     expect(result, isA<QuizModel>());
//     // expect(result.id, quizMap['title']); // наприклад, "title" має бути у QuizModel
//   });
// }
//
// const mockResponse = '''{
//   "id": "chatcmpl-f51b2cd2-bef7-417e-964e-a08f0b513c22",
//   "object": "chat.completion",
//   "created": 1730241104,
//   "model": "llama3-8b-8192",
//   "choices": [
//     {
//       "index": 0,
//       "message": {
//         "role": "assistant",
//         "content": "{\\"id\\":1,\\"questions\\":[{\\"id\\":1,\\"question\\":\\"What is Flutter?\\",\\"answers\\":[{\\"id\\":1,\\"answer\\":\\"SDK\\"},{\\"id\\":2,\\"answer\\":\\"Language\\"}],\\"correctAnswerId\\":1}]}"
//       },
//       "logprobs": null,
//       "finish_reason": "stop"
//     }
//   ],
//   "usage": {
//     "queue_time": 0.037493756,
//     "prompt_tokens": 18,
//     "prompt_time": 0.000680594,
//     "completion_tokens": 556,
//     "completion_time": 0.463333333,
//     "total_tokens": 574,
//     "total_time": 0.464013927
//   },
//   "system_fingerprint": "fp_179b0f92c9",
//   "x_groq": { "id": "req_01jbd6g2qdfw2adyrt2az8hz4w" }
// }''';
