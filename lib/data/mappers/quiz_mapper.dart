import 'package:space_scutum_quiz_test/data/mappers/question_mapper.dart';
import 'package:space_scutum_quiz_test/data/models/quiz_model.dart';
import 'package:space_scutum_quiz_test/domain/entities/quiz.dart';

extension QuizMapper on QuizModel {
  Quiz toDomain() {
    return Quiz(
      id: id,
      questions: questions.map((data) => data.toDomain()).toList(),
    );
  }
}
