part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

final class GetQuizEvent extends QuizEvent {}
