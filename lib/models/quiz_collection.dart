import 'package:equatable/equatable.dart';

class QuizCollection extends Equatable {
  const QuizCollection({
    required this.politics,
    required this.animals,
    required this.gk,
  });

  final Map<String, Quiz> politics;
  final Map<String, Quiz> animals;
  final Map<String, Quiz> gk;

  QuizCollection copyWith({
    Map<String, Quiz>? politics,
    Map<String, Quiz>? animals,
    Map<String, Quiz>? gk,
  }) {
    return QuizCollection(
      politics: politics ?? this.politics,
      animals: animals ?? this.animals,
      gk: gk ?? this.gk,
    );
  }

  factory QuizCollection.fromJson(Map<String, dynamic> json) {
    return QuizCollection(
      politics: Map.from(json["politics"])
          .map((k, v) => MapEntry<String, Quiz>(k, Quiz.fromJson(v))),
      animals: Map.from(json["animals"])
          .map((k, v) => MapEntry<String, Quiz>(k, Quiz.fromJson(v))),
      gk: Map.from(json["gk"])
          .map((k, v) => MapEntry<String, Quiz>(k, Quiz.fromJson(v))),
    );
  }

  @override
  List<Object?> get props => [
        politics,
        animals,
        gk,
      ];
}

class Quiz extends Equatable {
  const Quiz({
    required this.question,
    required this.image,
    required this.answer,
  });

  final String? question;
  final String? image;
  final QuizAnswer? answer;

  Quiz copyWith({
    String? question,
    String? image,
    QuizAnswer? answer,
  }) {
    return Quiz(
      question: question ?? this.question,
      image: image ?? this.image,
      answer: answer ?? this.answer,
    );
  }

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      question: json["question"],
      image: json["image"],
      answer:
          json["answer"] == null ? null : QuizAnswer.fromJson(json["answer"]),
    );
  }

  @override
  List<Object?> get props => [
        question,
        image,
        answer,
      ];
}

class QuizAnswer extends Equatable {
  const QuizAnswer({
    required this.correct,
    required this.incorrects,
  });

  final String? correct;
  final Map<String, String> incorrects;

  QuizAnswer copyWith({
    String? correct,
    Map<String, String>? incorrects,
  }) {
    return QuizAnswer(
      correct: correct ?? this.correct,
      incorrects: incorrects ?? this.incorrects,
    );
  }

  factory QuizAnswer.fromJson(Map<String, dynamic> json) {
    return QuizAnswer(
      correct: json["correct"],
      incorrects: Map.from(json["incorrects"])
          .map((k, v) => MapEntry<String, String>(k, v)),
    );
  }

  @override
  List<Object?> get props => [
        correct,
        incorrects,
      ];
}
