import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:space_scutum_quiz_test/data/models/quiz_model.dart';

abstract interface class QuizNetworkDataSource {
  Future<QuizModel> getQuiz();
}

class QuizNetworkDataSourceImpl implements QuizNetworkDataSource {
  final AssetBundle rootBundle;

  QuizNetworkDataSourceImpl({required this.rootBundle});

  @override
  Future<QuizModel> getQuiz() async {
    final content = await rootBundle.loadString('assets/quiz.json');
    final quizJson = jsonDecode(content);
    return QuizModel.fromJson(quizJson);
  }
}
