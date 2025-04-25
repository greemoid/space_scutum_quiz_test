import 'package:space_scutum_quiz_test/data/models/result_model.dart';
import 'package:space_scutum_quiz_test/domain/entities/result.dart';

extension ResultMapper on Result {
  ResultModel toData() => ResultModel(
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      createdAtUtc: createdAtUtc);
}

extension ResultModelMapper on ResultModel {
  Result toDomain() => Result(
      id: id,
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      createdAtUtc: createdAtUtc);
}
