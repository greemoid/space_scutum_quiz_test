import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_quiz_test/domain/entities/result.dart';
import 'package:space_scutum_quiz_test/domain/usecases/add_result_usecase.dart';
import 'package:space_scutum_quiz_test/domain/usecases/get_result_usecase.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final GetResultUsecase _getResultUsecase;
  final AddResultUsecase _addResultUsecase;

  ResultBloc(
      {required GetResultUsecase getResultUsecase,
      required AddResultUsecase addResultUsecase})
      : _getResultUsecase = getResultUsecase,
        _addResultUsecase = addResultUsecase,
        super(ResultInitial()) {
    on<ResultEvent>((event, emit) {
      emit(ResultLoading());
    });

    on<GetResultEvent>(_getResult);
    on<AddResultEvent>(_addResult);
  }

  _getResult(GetResultEvent event, Emitter<ResultState> emit) {
    final result = _getResultUsecase();

    result.fold((failure) => emit(ResultError(message: failure.message)),
        (result) => emit(ResultLoaded(result: result)));
  }

  _addResult(AddResultEvent event, Emitter<ResultState> emit) {
    final result = _addResultUsecase(event.result);

    result.fold((failure) => emit(ResultError(message: failure.message)),
        (id) => emit(ResultAdded(id: id)));
  }
}
