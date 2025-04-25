import 'package:equatable/equatable.dart';
import 'package:space_scutum_quiz_test/domain/entities/answer.dart';

class Question extends Equatable {
  final int id;
  final String question;
  final List<Answer> answers;
  final int correctAnswerId;

  const Question(
      {required this.id,
      required this.question,
      required this.answers,
      required this.correctAnswerId});

  @override
  List<Object> get props => [id, question, answers, correctAnswerId];
}
