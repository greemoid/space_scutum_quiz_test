import 'package:space_scutum_quiz_test/data/models/answer_model.dart';
import 'package:space_scutum_quiz_test/data/models/question_model.dart';
import 'package:space_scutum_quiz_test/data/models/quiz_model.dart';
import 'package:space_scutum_quiz_test/data/models/result_model.dart';
import 'package:space_scutum_quiz_test/domain/entities/answer.dart';
import 'package:space_scutum_quiz_test/domain/entities/question.dart';
import 'package:space_scutum_quiz_test/domain/entities/quiz.dart';
import 'package:space_scutum_quiz_test/domain/entities/result.dart';

// === Models ===

AnswerModel mockAnswerModel = const AnswerModel(id: 1, answer: "Answer A");

QuestionModel mockQuestionModel = QuestionModel(
  id: 101,
  question: "What is 2+2?",
  answers: [
    const AnswerModel(id: 1, answer: "3"),
    const AnswerModel(id: 2, answer: "4"),
    const AnswerModel(id: 3, answer: "5"),
  ],
  correctAnswerId: 2,
);

QuizModel mockQuizModel = QuizModel(
  id: 1,
  questions: [mockQuestionModel],
);

ResultModel mockResultModel = ResultModel(
  id: 1,
  totalQuestions: 10,
  correctAnswers: 8,
  createdAtUtc: DateTime.utc(2025, 04, 25),
);

// === Entities ===

Answer mockAnswer = Answer(id: 1, answer: "Answer A");

Question mockQuestion = Question(
  id: 101,
  question: "What is 2+2?",
  answers: [
    Answer(id: 1, answer: "3"),
    Answer(id: 2, answer: "4"),
    Answer(id: 3, answer: "5"),
  ],
  correctAnswerId: 2,
);

Quiz mockQuiz = Quiz(
  id: 1,
  questions: [mockQuestion],
);

Result mockResult = Result(
  id: 1,
  totalQuestions: 10,
  correctAnswers: 8,
  createdAtUtc: DateTime.utc(2025, 04, 25),
);
