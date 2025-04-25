part of 'quiz_bloc.dart';

@immutable
sealed class QuizState extends Equatable {}

final class QuizInitial extends QuizState {
  @override
  List<Object> get props => [];
}

final class QuizLoading extends QuizState {
  @override
  List<Object> get props => [];
}

final class QuizLoaded extends QuizState {
  final Quiz quiz;

  QuizLoaded({required this.quiz});

  @override
  List<Object> get props => [quiz];
}

final class QuizError extends QuizState {
  final String message;

  QuizError({required this.message});

  @override
  List<Object> get props => [message];
}
