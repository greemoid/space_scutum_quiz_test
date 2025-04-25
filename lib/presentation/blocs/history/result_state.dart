part of 'result_bloc.dart';

@immutable
sealed class ResultState extends Equatable {}

final class ResultInitial extends ResultState {
  @override
  List<Object> get props => [];
}

final class ResultLoading extends ResultState {
  @override
  List<Object> get props => [];
}

final class ResultLoaded extends ResultState {
  final List<Result> result;

  ResultLoaded({required this.result});

  @override
  List<Object> get props => [result];
}

final class ResultAdded extends ResultState {
  final int id;

  ResultAdded({required this.id});

  @override
  List<Object> get props => [id];
}

final class ResultError extends ResultState {
  final String message;

  ResultError({required this.message});

  @override
  List<Object> get props => [message];
}
