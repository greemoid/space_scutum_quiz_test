import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_quiz_test/core/router/router.dart';
import 'package:space_scutum_quiz_test/injection_container.dart';
import 'package:space_scutum_quiz_test/presentation/blocs/quiz/quiz_bloc.dart';

void main() {
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<QuizBloc>(),
      child: MaterialApp.router(
        title: 'Quiz Application',
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
      ),
    );
  }
}
