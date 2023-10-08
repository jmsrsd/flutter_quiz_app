import 'package:equatable/equatable.dart';

class QuizCollection extends Equatable {
  QuizCollection({
    required this.politics,
    required this.animals,
    required this.gk,
  });

  final Map<String, Animal> politics;
  final Map<String, Animal> animals;
  final Map<String, Animal> gk;

  QuizCollection copyWith({
    Map<String, Animal>? politics,
    Map<String, Animal>? animals,
    Map<String, Animal>? gk,
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
          .map((k, v) => MapEntry<String, Animal>(k, Animal.fromJson(v))),
      animals: Map.from(json["animals"])
          .map((k, v) => MapEntry<String, Animal>(k, Animal.fromJson(v))),
      gk: Map.from(json["gk"])
          .map((k, v) => MapEntry<String, Animal>(k, Animal.fromJson(v))),
    );
  }

  Map<String, dynamic> toJson() => {
        "politics": Map.from(politics)
            .map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
        "animals": Map.from(animals)
            .map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
        "gk": Map.from(gk)
            .map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
      };

  @override
  List<Object?> get props => [
        politics,
        animals,
        gk,
      ];
}

class Animal extends Equatable {
  Animal({
    required this.question,
    required this.image,
    required this.answer,
  });

  final String? question;
  final String? image;
  final Answer? answer;

  Animal copyWith({
    String? question,
    String? image,
    Answer? answer,
  }) {
    return Animal(
      question: question ?? this.question,
      image: image ?? this.image,
      answer: answer ?? this.answer,
    );
  }

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      question: json["question"],
      image: json["image"],
      answer: json["answer"] == null ? null : Answer.fromJson(json["answer"]),
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

class Answer extends Equatable {
  Answer({
    required this.correct,
    required this.incorrects,
  });

  final String? correct;
  final Map<String, String> incorrects;

  Answer copyWith({
    String? correct,
    Map<String, String>? incorrects,
  }) {
    return Answer(
      correct: correct ?? this.correct,
      incorrects: incorrects ?? this.incorrects,
    );
  }

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      correct: json["correct"],
      incorrects: Map.from(json["incorrects"])
          .map((k, v) => MapEntry<String, String>(k, v)),
    );
  }

  Map<String, dynamic> toJson() => {
        "correct": correct,
        "incorrects":
            Map.from(incorrects).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };

  @override
  List<Object?> get props => [
        correct,
        incorrects,
      ];
}
