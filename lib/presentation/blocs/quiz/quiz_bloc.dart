import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_quiz_test/domain/entities/quiz.dart';
import 'package:space_scutum_quiz_test/domain/usecases/get_quiz_usecase.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GetQuizUsecase _getQuizUsecase;

  QuizBloc({required GetQuizUsecase getQuizUsecase})
      : _getQuizUsecase = getQuizUsecase,
        super(QuizInitial()) {
    on<QuizEvent>((event, emit) {
      emit(QuizLoading());
    });

    on<GetQuizEvent>(_getQuiz);
  }

  void _getQuiz(GetQuizEvent event, Emitter<QuizState> emit) async {
    final result = await _getQuizUsecase();

    result.fold(
        (failure) => emit(QuizError(
              message: failure.message,
            )),
        (quiz) => emit(QuizLoaded(
              quiz: quiz,
            )));
  }
}
