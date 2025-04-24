import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_quiz_test/presentation/blocs/history/result_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Історія результатів',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ResultBloc, ResultState>(
          builder: (context, state) {
            if (state is ResultLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ResultLoaded) {
              final results = state.result;
              if (results.isEmpty) {
                return Center(
                  child: Text(
                    'Немає результатів',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                );
              }
              return ListView.separated(
                itemCount: results.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final result = results[index];
                  return _ResultCard(
                    index: index,
                    correctAnswers: result.correctAnswers,
                    totalQuestions: result.totalQuestions,
                    date: DateTime.now().toUtc(),
                  ).animate(delay: (100 * index).ms).fadeIn().slideX(
                        begin: 0.5,
                        end: 0,
                        duration: 300.ms,
                        curve: Curves.easeOutCubic,
                      );
                },
              );
            } else if (state is ResultError) {
              return Center(
                child: Text(
                  'Помилка: ${state.message}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red.shade400,
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final int index;
  final int correctAnswers;
  final int totalQuestions;
  final DateTime date;

  const _ResultCard({
    required this.index,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (correctAnswers / totalQuestions * 100).round();
    Color cardColor;
    IconData icon;

    if (percentage >= 80) {
      cardColor = Colors.green.shade400;
      icon = Icons.check_circle_outline;
    } else if (percentage >= 50) {
      cardColor = Colors.orange.shade400;
      icon = Icons.help_outline;
    } else {
      cardColor = Colors.red.shade400;
      icon = Icons.cancel_outlined;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Спроба #${index + 1}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${date.day}.${date.month}.${date.year}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '$correctAnswers/$totalQuestions',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
