part of 'result_bloc.dart';

@immutable
sealed class ResultEvent extends Equatable {}

final class GetResultEvent extends ResultEvent {
  @override
  List<Object> get props => [];
}

final class AddResultEvent extends ResultEvent {
  final Result result;

  AddResultEvent({required this.result});

  @override
  List<Object> get props => [result];
}
