import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_scutum_quiz_test/presentation/widgets/main_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.totalQuestions,
    required this.correctAnswers,
  });

  final int totalQuestions;
  final int correctAnswers;

  @override
  Widget build(BuildContext context) {
    final percentage = (correctAnswers / totalQuestions * 100).round();
    final isSuccess = percentage >= 70;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSuccess ? Icons.celebration : Icons.sentiment_neutral,
                size: 80,
                color: isSuccess ? Colors.green : Colors.orange,
              ),
              const SizedBox(height: 24),
              Text(
                isSuccess ? 'Congratulations!' : 'Good Try!',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'You scored $correctAnswers out of $totalQuestions',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),
              MainButton(onTap: () => context.push('/'), text: 'Return to Home')
            ],
          ),
        ),
      ),
    );
  }
}
