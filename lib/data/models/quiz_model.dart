import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:space_scutum_quiz_test/data/models/question_model.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

@freezed
abstract class QuizModel with _$QuizModel {
  const factory QuizModel({
    required int id,
    required List<QuestionModel> questions,
  }) = _QuizModel;

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);
}
