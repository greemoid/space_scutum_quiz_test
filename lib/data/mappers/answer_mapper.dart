import 'package:space_scutum_quiz_test/data/models/answer_model.dart';
import 'package:space_scutum_quiz_test/domain/entities/answer.dart';

extension AnswerMapper on AnswerModel {
  Answer toDomain() {
    return Answer(id: id, answer: answer);
  }
}
