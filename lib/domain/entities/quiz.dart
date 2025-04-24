import 'package:space_scutum_quiz_test/domain/entities/question.dart';

class Quiz {
  final int id;
  final List<Question> questions;

  Quiz({required this.id, required this.questions});
}
