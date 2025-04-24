import 'package:space_scutum_quiz_test/domain/entities/answer.dart';

class Question {
  final int id;
  final String question;
  final List<Answer> answers;
  final int correctAnswerId;

  Question(
      {required this.id,
      required this.question,
      required this.answers,
      required this.correctAnswerId});
}
