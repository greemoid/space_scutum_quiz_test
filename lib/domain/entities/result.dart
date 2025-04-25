import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final int? id;
  final int totalQuestions;
  final int correctAnswers;
  final DateTime createdAtUtc;

  const Result(
      {this.id,
      required this.totalQuestions,
      required this.correctAnswers,
      required this.createdAtUtc});

  @override
  List<Object?> get props => [
        id,
        totalQuestions,
        correctAnswers,
        createdAtUtc,
      ];
}
