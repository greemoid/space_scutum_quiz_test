import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:space_scutum_quiz_test/presentation/blocs/quiz/quiz_bloc.dart';
import 'package:space_scutum_quiz_test/presentation/widgets/main_button.dart';
import 'package:space_scutum_quiz_test/presentation/widgets/quiz_answer_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedAnswerId;
  bool _showResult = false;
  int _correctAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    context.read<QuizBloc>().add(GetQuizEvent());
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _selectedAnswerId = null;
      _showResult = false;
    });
  }

  void _selectAnswer(int answerId, int correctAnswerId) {
    if (_showResult) return;

    setState(() {
      _selectedAnswerId = answerId;
      _showResult = true;

      if (answerId == correctAnswerId) {
        _correctAnswersCount++;
      }
    });

    if (_currentQuestionIndex <
        (context.read<QuizBloc>().state as QuizLoaded).quiz.questions.length -
            1) {
      Future.delayed(const Duration(seconds: 2), _nextQuestion);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state is QuizLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is QuizError) {
                return Center(child: Text(state.message));
              } else if (state is QuizLoaded) {
                final questions = state.quiz.questions;
                final currentQuestion = questions[_currentQuestionIndex];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Question ${_currentQuestionIndex + 1}/${questions.length}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          final inAnimation = Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                              parent: animation, curve: Curves.easeIn));

                          final outAnimation = Tween<Offset>(
                            begin: Offset.zero,
                            end: const Offset(-1, 0),
                          ).animate(CurvedAnimation(
                              parent: animation, curve: Curves.easeOut));

                          return SlideTransition(
                            position:
                                animation.status == AnimationStatus.reverse
                                    ? outAnimation
                                    : inAnimation,
                            child: child,
                          );
                        },
                        child: Column(
                          key: ValueKey(_currentQuestionIndex),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentQuestion.question,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Expanded(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: currentQuestion.answers.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 16),
                                itemBuilder: (context, index) {
                                  final answer = currentQuestion.answers[index];
                                  final isSelected =
                                      _selectedAnswerId == answer.id;
                                  final isCorrect = answer.id ==
                                      currentQuestion.correctAnswerId;

                                  return QuizAnswerButton(
                                    text: answer.answer,
                                    isSelected: isSelected,
                                    isCorrect: isCorrect,
                                    onTap: () => _selectAnswer(answer.id,
                                        currentQuestion.correctAnswerId),
                                  );
                                },
                              ),
                            ),
                            if (_currentQuestionIndex == questions.length - 1 &&
                                _showResult)
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: MainButton(
                                  onTap: () {
                                    context.push(
                                        '/results/${questions.length}/$_correctAnswersCount');
                                  },
                                  text: 'Finish quiz',
                                ).animate().slideY(
                                      begin: 1,
                                      end: 0,
                                      duration: 150.ms,
                                      curve: Curves.easeIn,
                                    ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: Text('Something went wrong'));
              }
            },
          ),
        ),
      ),
    );
  }
}
