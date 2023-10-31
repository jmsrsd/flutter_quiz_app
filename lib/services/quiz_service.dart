import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/quiz_collection.dart';
import '../repositories/quiz_repository.dart';
import '../utils/db.dart';

class QuizService {
  final BuildContext context;

  QuizService.of(this.context);

  Future<void> collectQuiz() async {
    final repository = context.read<QuizRepository>();

    final data = await db.child('quiz').get();

    final encoded = jsonEncode(data.value ?? {});

    debugPrint('QuizCollection: $encoded');

    final decoded = jsonDecode(encoded);

    final json = Map.of(decoded).cast<String, dynamic>();

    final result = QuizCollection.fromJson(json);

    debugPrint('${result.runtimeType}: $result');

    await repository.put(result.toJson());
  }
}
