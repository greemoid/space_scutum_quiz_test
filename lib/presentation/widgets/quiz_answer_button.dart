import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class QuizAnswerButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;

  const QuizAnswerButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool showResult = isSelected;

    Color backgroundColor;
    IconData? resultIcon;
    Color borderColor = Colors.grey.shade300;

    if (!showResult) {
      backgroundColor = Colors.white;
    } else if (isCorrect) {
      backgroundColor = Colors.green.shade400;
      borderColor = Colors.green.shade700;
      resultIcon = Icons.check_circle_outline;
    } else {
      backgroundColor = Colors.red.shade400;
      borderColor = Colors.red.shade700;
      resultIcon = Icons.cancel_outlined;
    }

    return GestureDetector(
      onTap: showResult ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (resultIcon != null)
              Icon(
                resultIcon,
                color: Colors.white,
              ).animate().scale(begin: Offset.zero, end: Offset(1, 1)),
            if (resultIcon != null) const SizedBox(width: 12),
            Flexible(
              child: Text(
                key: ValueKey(text),
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: showResult ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      )
          .animate(target: showResult ? 1 : 0)
          .scaleXY(
            begin: 1.0,
            end: 1.05,
            duration: 100.ms,
          )
          .then(delay: 100.ms)
          .scaleXY(
            begin: 1.05,
            end: 1.0,
            duration: 100.ms,
          ),
    );
  }
}
