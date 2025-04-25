import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final int id;
  final String answer;

  const Answer({required this.id, required this.answer});

  @override
  List<Object> get props => [id, answer];
}
