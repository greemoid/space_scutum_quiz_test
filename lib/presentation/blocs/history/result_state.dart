part of 'result_bloc.dart';

@immutable
sealed class ResultState {}

final class ResultInitial extends ResultState {}

final class ResultLoading extends ResultState {}

final class ResultLoaded extends ResultState {
  final List<Result> result;

  ResultLoaded({required this.result});
}

final class ResultAdded extends ResultState {
  final int id;

  ResultAdded({required this.id});
}

final class ResultError extends ResultState {
  final String message;

  ResultError({required this.message});
}
