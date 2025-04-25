part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent extends Equatable {}

final class GetQuizEvent extends QuizEvent {
  @override
  List<Object> get props => [];
}
