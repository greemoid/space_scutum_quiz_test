import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:space_scutum_quiz_test/data/datasources/quiz_network_data_source.dart';
import 'package:space_scutum_quiz_test/data/repositories/quiz_repository_impl.dart';
import 'package:space_scutum_quiz_test/domain/repositories/quiz_repository.dart';
import 'package:space_scutum_quiz_test/domain/usecases/get_quiz_usecase.dart';
import 'package:space_scutum_quiz_test/presentation/blocs/quiz/quiz_bloc.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  serviceLocator
    ..registerFactory<QuizNetworkDataSource>(
        () => QuizNetworkDataSourceImpl(rootBundle: rootBundle))
    ..registerFactory<QuizRepository>(
        () => QuizRepositoryImpl(quizNetworkDataSource: serviceLocator()))
    ..registerLazySingleton<GetQuizUsecase>(
        () => GetQuizUsecase(quizRepository: serviceLocator()))
    ..registerLazySingleton<QuizBloc>(
        () => QuizBloc(getQuizUsecase: serviceLocator()));
}
