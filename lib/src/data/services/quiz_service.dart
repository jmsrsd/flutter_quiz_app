import 'dart:convert';

import 'package:flutter/material.dart';

import '../../common/models/quiz_collection.dart';
import '../../data/db.dart';

class QuizService {
  final BuildContext context;

  QuizService.of(this.context);

  Future<QuizCollection> collectQuiz() async {
    final data = await db.child('quiz').get();

    final encoded = jsonEncode(data.value ?? {});

    debugPrint('QuizCollection: $encoded');

    final decoded = jsonDecode(encoded);

    final json = Map.of(decoded).cast<String, dynamic>();

    final result = QuizCollection.fromJson(json);

    debugPrint('${result.runtimeType}: $result');

    return result;
  }
}
