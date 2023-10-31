import 'package:equatable/equatable.dart';

class QuizCollection extends Equatable {
  const QuizCollection({
    required this.animals,
    required this.gk,
    required this.politics,
  });

  final List<Quiz> animals;
  final List<Quiz> gk;
  final List<Quiz> politics;

  QuizCollection copyWith({
    List<Quiz>? animals,
    List<Quiz>? gk,
    List<Quiz>? politics,
  }) {
    return QuizCollection(
      animals: animals ?? this.animals,
      gk: gk ?? this.gk,
      politics: politics ?? this.politics,
    );
  }

  factory QuizCollection.fromJson(Map<String, dynamic> json) {
    return QuizCollection(
      animals: json["animals"] == null
          ? []
          : List<Quiz>.from(json["animals"]!.map((x) => Quiz.fromJson(x))),
      gk: json["gk"] == null
          ? []
          : List<Quiz>.from(json["gk"]!.map((x) => Quiz.fromJson(x))),
      politics: json["politics"] == null
          ? []
          : List<Quiz>.from(json["politics"]!.map((x) => Quiz.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "animals": animals.map((x) => x.toJson()).toList(),
        "gk": gk.map((x) => x.toJson()).toList(),
        "politics": politics.map((x) => x.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        animals,
        gk,
        politics,
      ];
}

class Quiz extends Equatable {
  const Quiz({
    required this.answer,
    required this.question,
    required this.image,
  });

  final Answer? answer;
  final String? question;
  final String? image;

  Quiz copyWith({
    Answer? answer,
    String? question,
    String? image,
  }) {
    return Quiz(
      answer: answer ?? this.answer,
      question: question ?? this.question,
      image: image ?? this.image,
    );
  }

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      answer: json["answer"] == null ? null : Answer.fromJson(json["answer"]),
      question: json["question"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "answer": answer?.toJson(),
        "question": question,
        "image": image,
      };

  @override
  List<Object?> get props => [
        answer,
        question,
        image,
      ];
}

class Answer extends Equatable {
  const Answer({
    required this.correct,
    required this.incorrects,
  });

  final String? correct;
  final List<String> incorrects;

  Answer copyWith({
    String? correct,
    List<String>? incorrects,
  }) {
    return Answer(
      correct: correct ?? this.correct,
      incorrects: incorrects ?? this.incorrects,
    );
  }

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      correct: json["correct"],
      incorrects: json["incorrects"] == null
          ? []
          : List<String>.from(json["incorrects"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "correct": correct,
        "incorrects": incorrects.map((x) => x).toList(),
      };

  @override
  List<Object?> get props => [
        correct,
        incorrects,
      ];
}
