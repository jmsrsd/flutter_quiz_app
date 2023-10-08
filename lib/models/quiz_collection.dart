import 'package:equatable/equatable.dart';

class QuizCollection extends Equatable {
  const QuizCollection({
    required this.politics,
    required this.animals,
    required this.gk,
  });

  final List<Quiz> politics;
  final List<Quiz> animals;
  final List<Quiz> gk;

  QuizCollection copyWith({
    List<Quiz>? politics,
    List<Quiz>? animals,
    List<Quiz>? gk,
  }) {
    return QuizCollection(
      politics: politics ?? this.politics,
      animals: animals ?? this.animals,
      gk: gk ?? this.gk,
    );
  }

  factory QuizCollection.fromJson(Map<String, dynamic> json) {
    return QuizCollection(
      politics:
          (json["politics"] as List).map((e) => Quiz.fromJson(e)).toList(),
      animals: (json["animals"] as List).map((e) => Quiz.fromJson(e)).toList(),
      gk: (json["gk"] as List).map((e) => Quiz.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "politics": politics.map((e) => e.toJson()),
        "animals": animals.map((e) => e.toJson()),
        "gk": gk.map((e) => e.toJson()),
      };

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

  Map<String, dynamic> toJson() => {
        "question": question,
        "image": image,
        "answer": answer?.toJson(),
      };

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
  final List<String> incorrects;

  QuizAnswer copyWith({
    String? correct,
    List<String>? incorrects,
  }) {
    return QuizAnswer(
      correct: correct ?? this.correct,
      incorrects: incorrects ?? this.incorrects,
    );
  }

  factory QuizAnswer.fromJson(Map<String, dynamic> json) {
    return QuizAnswer(
      correct: json["correct"],
      incorrects: (json["incorrects"] as List).map((e) => '$e').toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "correct": correct,
        "incorrects": incorrects,
      };

  @override
  List<Object?> get props => [
        correct,
        incorrects,
      ];
}
