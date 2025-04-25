import 'package:objectbox/objectbox.dart';

@Entity()
class ResultModel {
  @Id()
  int id;
  int totalQuestions;
  int correctAnswers;
  @Property(type: PropertyType.date)
  DateTime createdAtUtc;

  ResultModel(
      {this.id = 0,
      required this.totalQuestions,
      required this.correctAnswers,
      required this.createdAtUtc});
}
