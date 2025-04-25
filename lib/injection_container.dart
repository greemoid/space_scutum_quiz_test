import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:space_scutum_quiz_test/data/datasources/quiz_local_data_source.dart';
import 'package:space_scutum_quiz_test/data/datasources/quiz_network_data_source.dart';
import 'package:space_scutum_quiz_test/data/models/result_model.dart';
import 'package:space_scutum_quiz_test/data/repositories/quiz_repository_impl.dart';
import 'package:space_scutum_quiz_test/domain/repositories/quiz_repository.dart';
import 'package:space_scutum_quiz_test/domain/usecases/add_result_usecase.dart';
import 'package:space_scutum_quiz_test/domain/usecases/get_quiz_usecase.dart';
import 'package:space_scutum_quiz_test/domain/usecases/get_result_usecase.dart';
import 'package:space_scutum_quiz_test/objectbox.g.dart';
import 'package:space_scutum_quiz_test/presentation/blocs/history/result_bloc.dart';
import 'package:space_scutum_quiz_test/presentation/blocs/quiz/quiz_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final Store store = await openStore(directory: 'results');
  final box = store.box<ResultModel>();

  serviceLocator
    ..registerFactory<QuizNetworkDataSource>(
        () => QuizNetworkDataSourceImpl(rootBundle: rootBundle))
    ..registerFactory<QuizLocalDataSource>(
        () => QuizLocalDataSourceImpl(box: box))
    ..registerFactory<QuizRepository>(() => QuizRepositoryImpl(
        quizNetworkDataSource: serviceLocator(),
        quizLocalDataSource: serviceLocator()))
    ..registerLazySingleton<GetQuizUsecase>(
        () => GetQuizUsecase(quizRepository: serviceLocator()))
    ..registerLazySingleton<AddResultUsecase>(
        () => AddResultUsecase(quizRepository: serviceLocator()))
    ..registerLazySingleton<GetResultUsecase>(
        () => GetResultUsecase(quizRepository: serviceLocator()))
    ..registerLazySingleton<QuizBloc>(
        () => QuizBloc(getQuizUsecase: serviceLocator()))
    ..registerLazySingleton<ResultBloc>(() => ResultBloc(
        getResultUsecase: serviceLocator(),
        addResultUsecase: serviceLocator()));
}
