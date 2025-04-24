part of 'result_bloc.dart';

@immutable
sealed class ResultEvent {}

final class GetResultEvent extends ResultEvent {}

final class AddResultEvent extends ResultEvent {
  final Result result;

  AddResultEvent({required this.result});
}
