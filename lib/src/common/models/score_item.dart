import 'package:equatable/equatable.dart';

class ScoreItem extends Equatable {
  final String question;
  final String answer;
  final bool isCorrect;

  const ScoreItem({
    required this.question,
    required this.answer,
    required this.isCorrect,
  });

  @override
  List<Object?> get props {
    return [
      question,
      answer,
      isCorrect,
    ];
  }
}
