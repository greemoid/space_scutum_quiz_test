import 'package:equatable/equatable.dart';
import 'package:space_scutum_quiz_test/domain/entities/question.dart';

class Quiz extends Equatable {
  final int id;
  final List<Question> questions;

  const Quiz({required this.id, required this.questions});

  @override
  List<Object> get props => [id, questions];
}
