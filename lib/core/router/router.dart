import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_scutum_quiz_test/core/router/routes.dart';
import 'package:space_scutum_quiz_test/presentation/screens/home_screen.dart';
import 'package:space_scutum_quiz_test/presentation/screens/quiz_screen.dart';
import 'package:space_scutum_quiz_test/presentation/screens/result_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: Routes.home.path,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
              path: Routes.quiz.path,
              name: 'quiz',
              builder: (context, state) {
                return QuizScreen();
              }),
          GoRoute(
              path: '${Routes.results.path}/:total/:correct',
              name: 'results',
              builder: (context, state) {
                final total = int.parse(state.pathParameters['total']!);
                final correct = int.parse(state.pathParameters['correct']!);
                return ResultScreen(
                  totalQuestions: total,
                  correctAnswers: correct,
                );
              }),
        ]),
  ],
);
