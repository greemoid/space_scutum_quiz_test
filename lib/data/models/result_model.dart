import 'package:objectbox/objectbox.dart';

@Entity()
class ResultModel {
  @Id()
  int id;
  int totalQuestions;
  int correctAnswers;

  ResultModel(
      {this.id = 0,
      required this.totalQuestions,
      required this.correctAnswers});
}
