import 'package:space_scutum_quiz_test/data/mappers/answer_mapper.dart';
import 'package:space_scutum_quiz_test/data/models/question_model.dart';
import 'package:space_scutum_quiz_test/domain/entities/question.dart';

extension QuestionMapper on QuestionModel {
  Question toDomain() {
    return Question(
        id: id,
        question: question,
        answers: answers.map((data) => data.toDomain()).toList(),
        correctAnswerId: correctAnswerId);
  }
}
