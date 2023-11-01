import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/models/quiz_collection.dart';
import 'quiz_bloc.dart';

class TopicBloc extends Cubit<String?> {
  final BuildContext context;

  TopicBloc.of(this.context) : super(null) {
    set(state);
  }

  /// If the [value] is set to [null] it would make [quizzes] populated with 5
  /// random quizzes.
  ///

  final quizzes = <Quiz>[];

  void set(String? value) {
    quizzes.clear();

    emit('*');

    final collection = context.read<QuizBloc>().state.toJson();

    if (value == null) {
      final result = collection.entries
          .map((e) => e.value)
          .map((e) => List.of(e))
          .map((e) => e.cast<Map<String, dynamic>>())
          .reduce((a, b) => [...a, ...b])
          .map((e) => MapEntry(Random().nextDouble(), Quiz.fromJson(e)))
          .toList()
        ..sort((a, b) => a.key.compareTo(b.key));

      if (result.isEmpty) {
        emit(value);

        return;
      }

      quizzes.addAll(
        result
            .map((e) => e.value)
            .toList()
            .sublist(0, result.length.clamp(0, 5)),
      );

      emit(value);

      return;
    }

    final result = List.of(collection[value])
        .cast<Map<String, dynamic>>()
        .map((e) => MapEntry(Random().nextDouble(), Quiz.fromJson(e)))
        .toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    quizzes.addAll(result.map((e) => e.value).toList());

    emit(value);

    return;
  }
}
