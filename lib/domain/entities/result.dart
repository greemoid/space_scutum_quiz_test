class Result {
  final int? id;
  final int totalQuestions;
  final int correctAnswers;
  final DateTime createdAtUtc;

  Result(
      {this.id,
      required this.totalQuestions,
      required this.correctAnswers,
      required this.createdAtUtc});
}
