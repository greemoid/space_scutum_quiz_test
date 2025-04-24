part of 'quiz_bloc.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}

final class QuizLoading extends QuizState {}

final class QuizLoaded extends QuizState {
  final Quiz quiz;

  QuizLoaded({required this.quiz});
}

final class QuizError extends QuizState {
  final String message;

  QuizError({required this.message});
}
